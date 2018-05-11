class CreateEfficacies < ActiveRecord::Migration[5.2]
  def change
    create_table :efficacies do |t|
      t.string :value

      t.timestamps
    end
  end
end
