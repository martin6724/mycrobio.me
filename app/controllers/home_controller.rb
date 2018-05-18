class HomeController < ApplicationController
	def search
  		@search_results = Flora.where("name LIKE ?", "%#{params[:term]}%")
  		if @search_results.empty?
  			redirect_to root_path, flash: { error: "We couldn't find any results for your search. Please try again."}
  		end	
	end
end
