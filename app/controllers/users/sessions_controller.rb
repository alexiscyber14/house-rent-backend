class Users::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
        render json: {
            message: 'Logged in successfully.',
            user: current_user
        }, status: :ok
    end
  
    def on_destroy
        success_logged_out && return if current_user

        fail_logged_out
    end

    def success_logged_out
        render json: {message: 'logged out sucessfully'},status: :ok
    end

    def fail_logged_out
        render json: {message: 'Logged out failed'}, status: :unauthorized
    end
end
```