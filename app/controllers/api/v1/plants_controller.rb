class Api::V1::PlantsController < ApplicationController

  def create
    plant = Plant.new(plant_params)

    if plant.save
      render json: plant
    else
      render json: {errors: plant.errors.full_messages}
    end
  end
  
  def update

    plant = Plant.find(params[:id])

    plant.assign_attributes(plant_params)

    if plant.save
      render json: plant
    else
      render json: {errors: plant.errors.full_messages}
    end
  end

  private

  def plant_params
    params.permit(
      :species_id,
      :group_id,
      :name,
      :ph_min,
      :ph_max,
      :soil_moisture_min,
      :soil_moisture_max,
      :humidity_min,
      :humidity_max,
      :temperature_min
    )
  end
end
