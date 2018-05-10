class Organism < ApplicationRecord
	has_many :floras
	has_many :organ_systems, through: :floras
end
