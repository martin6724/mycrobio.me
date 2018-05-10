class CreateFloras < ActiveRecord::Migration[5.2]
  def change
    create_table :floras do |t|
      t.references :organ_system, foreign_key: true
      t.references :organism, foreign_key: true

      t.timestamps
    end
  end
end
