class Flora < ApplicationRecord
  belongs_to :organ_system
  belongs_to :organism
  has_many :efficacies
  has_many :antibiotics, through: :efficacies
end
