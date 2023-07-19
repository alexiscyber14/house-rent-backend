class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    success_register && return if resource.persisted?

    fail_register
  end

  def success_register
    render json: {
        message: 'success',
        user: current_user
    }, status: :ok
  end

  def fail_register
    render json: {
        message: "Something went wrong"
    }, status: :unprocessable_entity
  end
end
