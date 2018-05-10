class CreateAntibiotics < ActiveRecord::Migration[5.2]
  def change
    create_table :antibiotics do |t|
      t.string :name

      t.timestamps
    end
  end
end
