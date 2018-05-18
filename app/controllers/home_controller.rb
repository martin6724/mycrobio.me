class HomeController < ApplicationController
	def search
  		@results = Organism.where("name LIKE ?", "%#{params[:term]}%")
  		
	  		if @results.empty?
	  			puts "No organisms were found. Try again!" #msg in terminal
	  			flash[:error] = "No organisms were found. Try again!"
      			redirect_to root_path
	  		else 
		  		@results.each do |result|
		    		puts result.name #in terminal
		    		flash[:success] = "Search successful!"
      				#redirect_to result_path
		    	end
  			end
	end
end
