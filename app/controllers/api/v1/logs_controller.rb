class Api::V1::LogsController < ApplicationController
  before_action :authorized, only: [:create, :update]

  def create
    log = Log.new(log_params)

    if log.save
      render json: log
    else
      render json: {errors: log.errors.full_messages}
    end
  end

  def update
    log = Log.find(params[:id])

    log.assign_attributes(log_params)

    if log.save
      render json: log
    else
      render json: {errors: log.errors.full_messages}
    end
  end

  private 

  def log_params
    params.permit(:plant_id, :action_id, :amount)
  end
end
