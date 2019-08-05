class Api::V1::GroupsController < ApplicationController
  before_action :authorized, only: [:create, :update]

  def index
    render json: Group.all
    
  end

  def create
    group = Group.new(group_params)

    if group.save
      render json: group
    else
      render json: {errors: group.errors.full_messages}
    end

  end

  def update
    group = Group.find(params[:id])

    group.assign_attributes(group_params)

    if group.save
      render json: group
    else
      render json: {errors: group.errors.full_messages}
    end
  end

  private

  def group_params
    params.permit(:name, :user_id)
  end
end
