class OrganSystem < ApplicationRecord
	has_many :floras
	has_many :organisms, through: :floras
end
