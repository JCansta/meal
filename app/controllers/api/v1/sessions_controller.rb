class Api::V1::SessionsController < ApiController
    def create
        user = User.find_by!(email: sessions_params[:email])
        if user.authenticate(sessions_params[:password])
            token = JWT.encode({user_id: user.id}, 'a', 'HS256')
            return render json: {access_token: token}, status: :created
        else
            return render json: {errors: "usuario invalido"}, status: 404
        end
    end

    private

    def sessions_params
        params.require(:sessions).permit(:email, :password)
    end
end