class ApplicationController < ActionController::API

  def encode_token(user)
    JWT.encode(user_payload(user), "will and ferris", "HS256")
  end

  def user_payload(user)
    { user_id: user.id}
  end

  # delete localStorage.token to log out
end
