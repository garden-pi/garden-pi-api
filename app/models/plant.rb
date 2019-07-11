class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :group

  has_many :logs
  has_many :evaluations
end
