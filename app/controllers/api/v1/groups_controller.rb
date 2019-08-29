class Api::V1::GroupsController < ApplicationController
  before_action :authorized

  def index
    render json: @user.groups
  end

  def create
    group = @user.groups.create(name: params[:name])

    if group.save
      render json: group
    else
      render json: {errors: group.errors.full_messages}
    end

  end

  def update
    group = Group.find(params[:id])

    group.update(name: params[:name])

    if group.save
      render json: group
    else
      render json: {errors: group.errors.full_messages}
    end
  end
end
