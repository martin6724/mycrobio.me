class FlorasController < ApplicationController

  def index
    @floras = Flora.all
  end

  def show
    @singleton_floras = Organism.find_by_name(params[:id])
  end

end
