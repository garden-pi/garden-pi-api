class LogSerializer < ActiveModel::Serializer
  attributes :id, :amount, :action_id
end
