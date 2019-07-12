class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :species_id, :name, :ph_min, :ph_max, :soil_moisture_min, :soil_moisture_max, :humidity_min, :humidity_max, :temperature_min, :logs
  
  # has_many :logs
  has_many :evaluations
end
