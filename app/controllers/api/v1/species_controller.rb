class Api::V1::SpeciesController < ApplicationController
  def index
    search_term = params[:term]
    if search_term
      url = "https://trefle.io/api"
      headers = {"Authorization": "Bearer #{ENV["TREFLE_API_KEY"]}"}
      response = RestClient.get(url + "/plants?q=#{search_term}", headers)
      data = JSON.parse(response)

      new_species = Species.create_plants_from_query(data)

      found_species = Species.all.select do |species|

        (species.common_name && species.common_name.downcase.include?(search_term.downcase)) || (species.scientific_name && species.scientific_name.downcase.include?(search_term.downcase))
      end


      render json: new_species.concat(found_species)
    else
      render json: Species.all
    end
  end
end
