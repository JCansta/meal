class Api::V1::SessionsController < ApiController
    def create
        user = User.find_by(email: params[:email])
        if user.authenticate(params[:password])
            token = JWT.encode({user_id: user.id}, 'a', 'HS256')
            render json: {access_token: token}, status: :created
        else
            render json: {errors: "usuario invalido"}, status: :forbidden
        end
    end

    def sessions_params
        params.permit(:email, :password)
    end
end