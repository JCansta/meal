class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
            token = JWT.encode({user_id: user.id}, 'a', 'HS256')
            render json: {access_token: token}
        else
            render json: {errors: "usuario invalido"}
        end
    end

    def sessions_params
        params.permit(:email, :password)
    end
end