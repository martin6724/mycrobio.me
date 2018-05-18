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
  @nasofos =  Flora.where(organ_system: nasopharynx)
    .map{ |flora| flora.organism.name }
  end

  def respiratory_trigger
    respiratory = OrganSystem.find_by(name: 'respiratory')
  @respifos =  Flora.where(organ_system: respiratory)
    .map{ |flora| flora.organism.name }
  end

  def stomach_trigger
    stomach = OrganSystem.find_by(name: 'stomach')
  @stomafos =  Flora.where(organ_system: stomach)
    .map{ |flora| flora.organism.name }
  end

  def smallintestine_trigger
    smallintestine = OrganSystem.find_by(name: 'small intestine')
  @sifos =  Flora.where(organ_system: smallintestine)
    .map{ |flora| flora.organism.name }
  end

  def largeintestine_trigger
    largeintestine = OrganSystem.find_by(name: 'large intestine')
    @lifos = Flora.where(organ_system: largeintestine)
      .map{ |flora| flora.organism.name }
  end

  def urinary_trigger
    urethra = OrganSystem.find_by(name: 'urethra')
  @urifos =  Flora.where(organ_system: urethra)
    .map{ |flora| flora.organism.name }
  end

  def genitalia_trigger
    genitalia = OrganSystem.find_by(name: 'genitalia')
    @genit = Flora.where(organ_system: genitalia)
      .map{ |flora| flora.organism.name }
  end

  def skin_trigger
    skin = OrganSystem.find_by(name: 'skin')
  @skifos =  Flora.where(organ_system: skin)
    .map{ |flora| flora.organism.name }
  end

end
