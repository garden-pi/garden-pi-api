class Group < ApplicationRecord
  belongs_to :user
  has_many :plants
  has_many :species, through: :plants
end
