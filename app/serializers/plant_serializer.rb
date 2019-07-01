class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name

  belongs_to :species

  has_many :measurements
  has_many :evaluations
end
