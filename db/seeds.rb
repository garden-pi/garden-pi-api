# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

url = "https://trefle.io/api"
headers = {"Authorization": "Bearer #{ENV["TREFLE_API_KEY"]}"}


response = RestClient.get(url + "/plants", headers)
data = JSON.parse(response)

data.each do |species|
  res = RestClient.get(url + "/plants/#{species["id"]}", headers)

  plant_data = JSON.parse(res)
  byebug
end

