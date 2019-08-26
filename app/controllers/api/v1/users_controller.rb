class Api::V1::UsersController < ApplicationController
  before_action :authon    
    user = session_user

    user.assign_attributes(user_params)

    if user.save
      render json: user, include: "*.*.*", status: :created
    else
      render json: {errors: user.errors.full_messages}
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
