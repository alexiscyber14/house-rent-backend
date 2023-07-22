class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  include RackSessionsFix

  respond_to :json

  def destroy
    sign_out(current_user)

    render json: {
      message: 'Logged out successfully.'
    }, status: :ok
  end

  private

  def respond_with(_resource, _opts = {})
    user = current_user
    render json: {
      message: 'Logged in successfully.',
      data: { user: }
    }, status: :ok
  end
end
