class ApplicationController < ActionController::API
  before_action :authorized

  def encode_token(payload)
    JWT.encode({user_id: payload}, ENV["SECRET_KEY"])
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decode_token
    if auth_header
      token = auth_header
      begin
        JWT.decode(token, ENV["SECRET_KEY"], true, algorithm: "HS256")
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decode_token
      user_id = decode_token[0]["user_id"]
      @user = User.find(user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: "Please log in"}, status: :unauthorized unless logged_in?
  end

end
