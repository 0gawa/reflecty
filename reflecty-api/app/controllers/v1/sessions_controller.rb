module V1
  class SessionsController < Devise::SessionsController
    respond_to :json

    def create
      user = User.find_by_email(sign_in_params[:email])

      if user && user.valid_password?(sign_in_params[:password])
        sign_in(user)
        render json: {
          status: { code: 200, message: 'Logged in successfully.' },
          data: UserSerializer.new(user).serializable_hash[:data][:attributes]
        }
      else
        render json: {
          status: { message: "Invalid email or password." }
        }, status: :unauthorized
      end
    end

    private

    def respond_with(resource, _opts = {})
      render json: {
        status: { code: 200, message: 'Logged in successfully.' },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_user
        render json: {
          status: 200,
          message: "logged out successfully"
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end
  end
end
