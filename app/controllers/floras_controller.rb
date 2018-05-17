class FlorasController < ApplicationController

def nasopharynx_list
  @nasopharynx = OrganSystem.find_by(name: 'nasopharynx')
  @nasfos = Flora.where(organ_system: nasopharynx).map{|flora| flora.organism }
  @nasfos.each {|nasfo| puts nasfo.name}
end


def largeintestine
  large_intestine = OrganSystem.find_by(name: 'large intestine')
  @lifos = Flora.where(organ_system: large_intestine)
    .map{ |flora| flora.organism.name }
  if @lifos.empty?
    raise RuntimeError.new '@lifos are empty'
  end
end

def largeintestine_trigger
  large_intestine = OrganSystem.find_by(name: 'large intestine')
  @lifos = Flora.where(organ_system: large_intestine)
    .map{ |flora| flora.organism.name }
  if @lifos.empty?
    raise RuntimeError.new '@lifos are empty'
  end
end

def smallintestine_list
  small_intestine = OrganSystem.find_by(name: 'small intestine')
  @sifos = Flora.where(organ_system: small_intestine).map{|flora| flora.organism }
  @sifos.each {|sifo| puts sifo.name}
end
end
