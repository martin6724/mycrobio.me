class HomeController < ApplicationController
	def search
  		@search_results = Organism.where("name LIKE ?", "%#{params[:term]}%")
	  		unless @search_results.empty?
		    	render 'search_results'
	  		else
	  			puts "Nothing found."
	  			redirect_to root_path
	  		end	
	end
end
