class LogSerializer < ActiveModel::Serializer
  attributes :id
  has_one :action
  has_one :plant
end
