class HomeController < ApplicationController
	def search
  		@results = Organism.where("name LIKE ?", "%#{params[:term]}%")
	  		unless @results.empty?
		  		@results.each do |result|
		    		puts result.name #in terminal
		    		flash[:success] = "Search successful!"
      				
		    	end
	  		else
	  			puts "Nothing found."
	  		end	
			redirect_to root_path
	end
end
