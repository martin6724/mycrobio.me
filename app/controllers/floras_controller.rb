class FlorasController < ApplicationController
  def index
    @floras = Flora.all
  end

def show
  @flora = Flora.find(params[:id])
end

end
