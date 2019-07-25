class Api::V1::EvaluationsController < ApplicationController
  before_action :authorized, only: [:create, :update]

  def create
    evaluation = Evaluation.new(eval_params)

    if evaluation.save
      render json: evaluation
    else
      render json: {errors: evaluation.errors.full_messages}
    end
  end

  def update
    evaluation = Evaluation.find(params[:id])

    evaluation.assign_attributes(eval_params)

    if evaluation.save
      render json: evaluation
    else
      render json: {errors: evaluation.errors.full_messages}
    end
  end

  private 

  def eval_params
    params.permit(:plant_id, :number_fruit, :height, :overall_health, :notes)
  end

end
