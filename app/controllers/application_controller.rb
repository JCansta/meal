class ApplicationController < ActionController::API
    def authenticate
        response = request.headers["Authorization"].split(" ")[1]
        decode_token = JWT.decode response, 'a', true, {algorithm: 'HS256'}
        user_id = decode_token[0]["user_id"]
        @current_user = User.find(user_id)
    end
    attr_reader :current_user 
end
