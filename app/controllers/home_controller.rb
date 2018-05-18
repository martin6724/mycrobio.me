class HomeController < ApplicationController
	def search
  		@result = Organism.where name: params[:term]
	end
end
