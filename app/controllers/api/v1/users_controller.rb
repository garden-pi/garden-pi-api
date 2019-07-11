class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:profile]
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token(user_id: user.id)

      render json: {user: UserSerializer.new(user), jwt: token }, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def show
    render json: User.find(params[:id]), include: "*.*.*"
  end
  
  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
