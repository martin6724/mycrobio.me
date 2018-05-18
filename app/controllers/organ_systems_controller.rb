class OrganSystemsController < ApplicationController
  def index
  end

  def show
  end

  def create
  end

  def female_index
  end

  def nasopharynx_trigger
    nasopharynx = OrganSystem.find_by(name: 'nasopharynx')
    @organisms = nasopharynx.organisms
  end

  def respiratory_trigger
    respiratory = OrganSystem.find_by(name: 'respiratory')
    @organisms = respiratory.organisms
  end

  def stomach_trigger
    stomach = OrganSystem.find_by(name: 'stomach')
    @organisms = stomach.organisms
  # @stomafos =  Flora.where(organ_system: stomach)
  #   .map{ |flora| flora.organism.name }
  end

  def smallintestine_trigger
    smallintestine = OrganSystem.find_by(name: 'small intestine')
    @organisms = smallintestine.organisms
  end

  def largeintestine_trigger
    largeintestine = OrganSystem.find_by(name: 'large intestine')
    @organisms = largeintestine.organisms

  end

  def urinary_trigger
    urinary = OrganSystem.find_by(name: 'urethra')
    @organisms = urinary.organisms
  end

  def genitalia_trigger
    genitalia = OrganSystem.find_by(name: 'genitalia')
    @organisms = genitalia.organisms
  end

  def skin_trigger
    skin = OrganSystem.find_by(name: 'skin')
    @organisms = skin.organisms
  end

end
