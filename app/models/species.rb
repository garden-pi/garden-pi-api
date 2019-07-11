class Species < ApplicationRecord
  has_many :plants

  def self.create_plants_from_query(data)
    url = "https://trefle.io/api"
    headers = {"Authorization": "Bearer #{ENV["TREFLE_API_KEY"]}"}

    new_species = []
    data.each do |species_data|

      if (!Species.find_by(trefle_id: species_data["id"]))

        res = RestClient.get(url + "/plants/#{species_data["id"]}", headers)

        species_data = JSON.parse(res)

        species = Species.create(
          scientific_name: species_data["scientific_name"],
          common_name: species_data["common_name"],
          trefle_id: species_data["id"],
          ph_min: species_data["main_species"]["growth"]["ph_minimum"],
          ph_max: species_data["main_species"]["growth"]["ph_maximum"],
          temperature_min: species_data["main_species"]["growth"]["temperature_minimum"]["deg_c"],
          precipitation_min: species_data["main_species"]["growth"]["precipitation_minimum"]["cm"],
          precipitation_max: species_data["main_species"]["growth"]["precipitation_maximum"]["cm"],
          root_depth_min: species_data["main_species"]["growth"]["root_depth_minimum"]["cm"]
        )

        new_species << species
      end
    end
    
    new_species
  end
end
