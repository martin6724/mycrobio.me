class HomeController < ApplicationController
	def search
  		@results = Organism.where("name LIKE ?", "%#{params[:term]}%")
	  		unless @results.empty?
		  		@results.each do |result|
		    		puts result.name #in terminal
		    	end
		    	render 'kitty'
	  		else
	  			puts "Nothing found."
	  			redirect_to root_path
	  		end	
	end
end
