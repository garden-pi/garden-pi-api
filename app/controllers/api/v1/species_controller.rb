class Api::V1::SpeciesController < ApplicationController
  def index
    search_term = params[:term]
    if search_term
      
    else
      render json: Species.all
    end
  end
end
