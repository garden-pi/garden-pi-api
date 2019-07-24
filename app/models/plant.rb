class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :group

  has_many :logs
  has_many :evaluations

  def measurements
    if logging_enabled
      # fetch from dynamo!
      dynamodb = Aws::DynamoDB::Client.new
      params = {
          table_name: 'GardenParty',
          key_condition_expression: "#plant = :plant",
          expression_attribute_names: {
            "#plant": "plant"
          },
          expression_attribute_values: {
            ":plant": name
          }
      }
      response = dynamodb.query(params)
      if response
        response["items"]
      end
    end
  end

end
