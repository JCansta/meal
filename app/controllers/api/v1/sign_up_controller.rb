class Api::V1::SignUpController < ApplicationController
    def create
        user = User.new(email: sign_up_params[:email], password: sign_up_params[:password])
        if user.save
            token = JWT.encode({user_id: user.id}, 'a', 'HS256')
            render json: {access_token: token}
        else
            render json: {errors: "usuario no puede registrarse"}
        end
    end
    def sign_up_params
        params.require(:sign_up).permit(:email, :password)
    end
end