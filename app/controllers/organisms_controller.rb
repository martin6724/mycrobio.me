class OrganismsController < ApplicationController

  def index
    @organisms = Organism.all
  end

  def show
    @organism = Organism.find(params[:id])
    @organ_system_id = params[:organ_system_id]
    flora = Flora.where(organism_id: params[:id], organ_system: params[:organ_system_id]).first
    @efficacies = Efficacy.where(flora_id: flora.id).where('rating is not null')
  end

  def search_show
    @organism = Organism.find(params[:organism_id])
    @floras = @organism.floras
  end
end
