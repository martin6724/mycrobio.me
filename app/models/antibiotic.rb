class Antibiotic < ApplicationRecord
	has_many :efficacies
	has_many :floras, through: :efficacies
end
