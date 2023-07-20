class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  include RackSessionsFix

  respond_to :json

  private

  def respond_with(_resource, _opts = {})
    render json: {
      message: 'Logged in successfully.',
      data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(request.headers['Authorization'].split.last,
                               Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      success_signout
    else
      fail_signout
    end
  end

  def success_signout
    render json: {
      message: 'Logged out successfully.'
    }, status: :ok
  end

  def fail_signout
    render json: {
      message: "Couldn't find an active session."
    }, status: :unauthorized
  end
end
