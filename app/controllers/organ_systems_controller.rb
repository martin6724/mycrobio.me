class OrganSystemsController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def nasopharynx_trigger
  end

  def respiratory_trigger
  end

  def stomach_trigger
  end

  def smallintestine_trigger
  end

  def largeintestine_trigger
    large_intestine = OrganSystem.find_by(name: 'large intestine')
    @lifos = Flora.where(organ_system: large_intestine)
      .map{ |flora| flora.organism.name }
    if @lifos.empty?
      raise RuntimeError.new '@lifos are empty'
    end
  end

  def urinary_trigger
  end

  def female_genitalia_trigger
  end

  def male_genitalia_trigger
  end

  def skin_trigger
  end

end
