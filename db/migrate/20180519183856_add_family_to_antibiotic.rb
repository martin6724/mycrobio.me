class AddFamilyToAntibiotic < ActiveRecord::Migration[5.2]
  def change
  	add_column :antibiotics, :family, :string
  end
end
