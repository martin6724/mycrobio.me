class OrganSystemsController < ApplicationController
  def index
  end

  def show
    @organ_system = OrganSystem.find(params[:id])
    @organisms = @organ_system.organisms
  end

  def create
  end

  def female_index
    @organ_systems = OrganSystem.all
  end

  def male_index
    @organ_systems = OrganSystem.all
  end
end
