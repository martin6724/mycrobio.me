class CreateOrganSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :organ_systems do |t|
      t.string :name

      t.timestamps
    end
  end
end
