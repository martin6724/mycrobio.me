class HomeController < ApplicationController
	def search
  		@results = Organism.where("name LIKE ?", "%#{params[:term]}%")
  		
	  		if @results.nil?
	  			puts "No organisms were found. Try again!"
	  		else 
		  		@results.each do |result|
		    		link_to result.name, result
		    	end
  			end
	end
end
