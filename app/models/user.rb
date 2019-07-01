class User < ApplicationRecord
  has_many :groups
  has_many :plants, through: :groups

  has_secure_password

  validates: :email, uniqueness: true, presence: true
  validates: :name, presence: true
end
