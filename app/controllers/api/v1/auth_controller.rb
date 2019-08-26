class Api::V1::AuthController < ApplicationController
  before_action :authorized, only: [:auto_login]
  
  def login
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      token = encode_token({ user_id: user.id })

      render json: { user: UserSerializer.new(user), jwt: token }, include: "*.*.*", status: :accepted
    else
      render json: { message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def auto_login
    render json: { user: UserSerializer.new(session_user) }, include: "*.*.*", status: :accepted
  end
end
