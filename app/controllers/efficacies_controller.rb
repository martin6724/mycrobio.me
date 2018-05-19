class EfficaciesController < ApplicationController
  def show
    @efficacy = Efficacy.find_by_name(params[:id])
  end
end
