class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix

  respond_to :json

  private

  def respond_with(resource, _opts = {})
    success_register && return if resource.persisted?

    fail_register
  end

  def success_register
    render json: {
      message: 'success',
      data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def fail_register
    render json: {
      message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"
    }, status: :unprocessable_entity
  end
end
