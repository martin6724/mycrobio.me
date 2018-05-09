class CreateOrganisms < ActiveRecord::Migration[5.2]
  def change
    create_table :organisms do |t|
      t.string :name

      t.timestamps
    end
  end
end
