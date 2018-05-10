# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'json'

html = File.read "db/bugs.html"
dom = Nokogiri::HTML html
names = []
data = dom.css("tr").map do |row|
	names << row.text.strip.split("\n")[0]
end

names = names.slice(2..-6)

names.each do |x|
	Organism.create(name: x)
end

organ_systems = JSON.parse(File.read('db/organ_systems.json'))
organ_systems.each do |y|
	OrganSystem.create(name: y)
end

