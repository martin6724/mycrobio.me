class CreateEfficacies < ActiveRecord::Migration[5.2]
  def change
    create_table :efficacies do |t|
      t.references :flora, foreign_key: true
      t.references :antibiotic, foreign_key: true

      t.timestamps
    end
  end
end
