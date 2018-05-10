class Antibiotic < ApplicationRecord
	has_many :floras, through: :efficacies
end
