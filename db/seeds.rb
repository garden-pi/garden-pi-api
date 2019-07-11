puts "Creating species..."
url = "https://trefle.io/api"
headers = {"Authorization": "Bearer #{ENV["TREFLE_API_KEY"]}"}

response = RestClient.get(url + "/plants", headers)
data = JSON.parse(response)

Species.create_plants_from_query(data)
puts "Finished creating species"

puts "Creating users..."
10.times do 

  name = Faker::Name.name
  email = name.downcase.gsub(/\s/, ".") + "@gmail.com"

  User.create(
    name: name,
    email: email,
    password: "123"
  )
end
puts "Finished creating users"

puts "Creating groups..."
User.all.each do |user|
  (1..4).to_a.sample.times do
    Group.create(
      name: Faker::Kpop.iii_groups,
      user: user
    )
  end
end
puts "Finished creating groups"

puts "Creating plants..."

def generate_random_float(max, min = 0)
  [true, false].sample ? (rand*(max-min) + min).round(2) : nil
end

Group.all.each do |group|

  (3..12).to_a.sample.times do

    

    Plant.create(
      group: group,
      species: Species.all.sample,
      name: Faker::Games::Pokemon.name,
      ph_min: generate_random_float(7),
      ph_max: generate_random_float(14),
      soil_moisture_min: generate_random_float(5),
      soil_moisture_max: generate_random_float(20),
      humidity_min: generate_random_float(20),
      humidity_max: generate_random_float(80),
      temperature_min: generate_random_float(55)
    )
  end
end
puts "Finished creating plants"


