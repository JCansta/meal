class Api::V1::SignUpController < ApiController
    def create
        user = User.new(email: sign_up_params[:email], password: sign_up_params[:password])
        user.save!
        token = JWT.encode({user_id: user.id}, 'a', 'HS256')
        render json: {access_token: token}, status: :created
    end

    private

    def sign_up_params
        params.require(:sign_up).permit(:email, :password)
    end
end