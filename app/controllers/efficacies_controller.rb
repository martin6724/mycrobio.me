class EfficaciesController < ApplicationController
  def show
    @efficacy = Efficacy.find_by_name(params[:id])
    @organism = Organism.find(params[:organism_id])
  end

end
