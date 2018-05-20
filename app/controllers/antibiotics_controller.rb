class AntibioticsController < ApplicationController

  def index
    @antibiotics = Antibiotic.all

  end

  def show
    @antibiotic = Antibiotic.find_by_name(params[:id])
    
    efficacy = Efficacy.find_by(antibiotic: @antibiotic)

  end


end
