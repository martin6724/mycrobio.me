class FlorasController < ApplicationController

def index
  @floras = Flora.all
end

def show
  @singleton_floras = [Flora.find(params[:id]), ]
end

end
