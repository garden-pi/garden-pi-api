class SpeciesSerializer < ActiveModel::Serializer
  attributes :id, :scientific_name, :trefle_id, :ph_min, :ph_max, :soil_moisture_min, :soil_moisture_max, :humidity_min, :humidity_max, :common_name, :moisture_use, :temperature_min, :precipitation_min, :precipitation_max, :root_depth_min
end
