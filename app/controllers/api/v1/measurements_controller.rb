class Api::V1::MeasurementsController < ApplicationController
  def index
    plant_name = 'iot_test2'

    dynamodb = Aws::DynamoDB::Client.new
    params = {
        table_name: 'GardenPartyPi',
        key: {
            Plant: plant_name
        }
    }
    response = dynamodb.get_item(params)
    render json: response[:item]
  end
end
