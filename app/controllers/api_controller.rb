class ApiController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
    rescue_from ActiveRecord::RecordInvalid, :with => :invalid

    def authenticate
        response = request.headers["Authorization"].split(" ")[1]
        decode_token = JWT.decode response, 'a', true, {algorithm: 'HS256'}
        user_id = decode_token[0]["user_id"]
        @current_user = User.find(user_id)
    end
    attr_reader :current_user 

    def render_404(message)
        return render json: {message: message}
    end

    def invalid(message)
        return render json: {message: message}
    end
end
