class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.belongs_to :species, foreign_key: true
      t.belongs_to :group, foreign_key: true
      t.string :name
      t.float :ph_min
      t.float :ph_max
      t.float :soil_moisture_min
      t.float :soil_moisture_max
      t.float :humidity_min
      t.float :humidity_max
      t.float :temperature_min

      t.timestamps
    end
  end
end
