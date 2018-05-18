class HomeController < ApplicationController
	def search
  		@results = Organism.where("name LIKE ?", "%#{params[:term]}%")
	  		unless @results.empty?
		    	render 'search_results'
	  		else
	  			puts "Nothing found."
	  			redirect_to root_path
	  		end	
	end
end
