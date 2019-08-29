class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:update]
  def create
    user = User.new(user_params)

    if user.save
      token = encode_token(user_id: user.id)

      render json: {user: UserSerializer.new(user), jwt: token }, include: "*.*.*", status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  def update
    @user.assign_attributes(user_params)

    if @user.save
      render json: @user, include: "*.*.*", status: :created
    else
      render json: {errors: @user.errors.full_messages}
    end
  end

  def show
    render json: User.find(params[:id]), include: "*.*.*"
  end
  
  private

  def user_params
    params.permit(:email, :password, :name)
  end
end
