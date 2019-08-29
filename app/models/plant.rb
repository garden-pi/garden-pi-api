class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :group

  has_many :logs, dependent: :destroy
  has_many :evaluations, dependent: :destroy

  def measurements
    if logging_enabled
      # fetch from dynamo!
      dynamodb = Aws::DynamoDB::Client.new
      params = {
          table_name: 'GardenParty',
          key_condition_expression: "#plant = :plant AND #timestamp > :last_week",
          expression_attribute_names: {
            "#plant": "plant",
            "#timestamp": "timestamp"
          },
          expression_attribute_values: {
            ":plant": name,
            ":last_week": (Date.today - 30).to_time.to_i
          }
      }
      response = dynamodb.query(params)
      # byebug
      if response
        result = []
        while response["items"].length > 0
          first_eight = response["items"].slice!(0..7)
          avg_hash = {
            timestamp: first_eight[0]["timestamp"].to_i,
            moisture: 0,
            temperature: 0,
            humidity: 0
          }
          first_eight.reduce(avg_hash) do |sum, cur|
            avg_hash[:moisture] += cur["moisture"].to_i
            avg_hash[:temperature] += cur["temperature"].to_i
            avg_hash[:humidity] += cur["humidity"].to_i
            avg_hash
          end
          avg_hash[:moisture] = avg_hash[:moisture].to_f / first_eight.length
          avg_hash[:temperature] = avg_hash[:temperature].to_f / first_eight.length
          avg_hash[:humidity] = avg_hash[:humidity].to_f / first_eight.length
          
          puts avg_hash
          result.push(avg_hash)
        end

        result
      end
    end
  end

end
