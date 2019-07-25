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

puts "Creating actions..."
actions = [
  {action_type: "Water", unit: "liter"},
  {action_type: "Prune"},
  {action_type: "Harvest", unit: "kilograms"},
  {action_type: "Sun", unit: "minutes"},
  {action_type: "Shade", unit: "minutes" },
  {action_type: "Fertilize", unit: "kilograms"},
  {action_type: "Weed"},
  {action_type: "Transplant"},
  {action_type: "Deadhead"},
  {action_type: "Mulch"}
]

actions.each do |action|
  Action.create(action)
end
puts "Finished creating actions"

puts "Creating plants..."

def generate_random_float(max, min = 0)
  [true, false].sample ? (rand*(max-min) + min).round(2) : nil
end

Group.all.each do |group|

  (3..12).to_a.sample.times do
    plant = Plant.create(
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

    (2..30).to_a.sample.times do 
      Log.create(
        plant: plant,
        action: Action.all.sample,
        amount: generate_random_float(50,10)
      )
    end

    (2..30).to_a.sample.times do 
      Evaluation.create(
        number_fruit: (0..30).to_a.sample,
        height: generate_random_float(100),
        overall_health: [1,2,3,4,5].sample,
        notes: Faker::Lorem.sentence ,
        plant: plant
      )
    end
  end
end

# for AWS test
Plant.create(
  group: Group.first,
  species: Species.all.sample,
  name: "iot_test2",
  ph_min: generate_random_float(7),
  ph_max: generate_random_float(14),
  soil_moisture_min: generate_random_float(5),
  soil_moisture_max: generate_random_float(20),
  humidity_min: generate_random_float(20),
  humidity_max: generate_random_float(80),
  temperature_min: generate_random_float(55),
  logging_enabled: true
)
puts "Finished creating plants"










