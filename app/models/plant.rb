class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :group

  has_many :measurements
  has_many :evaluations
end
