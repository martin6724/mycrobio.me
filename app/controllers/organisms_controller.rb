class OrganismsController < ApplicationController

  def index
    @organisms = Organism.all
  end

  def show
    @organism = Organism.find_by_name(params[:id])
  end

end
