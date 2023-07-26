class Users::SessionsController < Devise::SessionsController
  include ActionController::MimeResponds
  include RackSessionsFix

  respond_to :json

  def create
    user = current_user
    respond_with user
  end

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
