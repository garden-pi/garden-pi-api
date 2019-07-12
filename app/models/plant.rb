class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :group

  # has_many :logs
  has_many :evaluations

  def logs
    if self.logging_enabled
      # fetch from dynamo!
      dynamodb = Aws::DynamoDB::Client.new
      params = {
          table_name: 'GardenPartyPi',
          key: {
              Plant: self.name
          }
      }
      response = dynamodb.get_item(params)
      if response
        response["item"]["points"]
      end
    end
  end

end
