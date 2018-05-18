class FlorasController < ApplicationController

def index
  @floras = Flora.all
  @antibiotics = Antibiotics.all
end

def show
  @singleton_floras = [Flora.find(params[:id]), ]
  @antibiotic_efficacies = [Antibiotic.find(params[:id]), ]
end

end
