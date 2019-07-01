class CreateSpecies < ActiveRecord::Migration[5.2]
  def change
    create_table :species do |t|
      t.string :scientific_name
      t.integer :trefle_id
      t.float :ph_min
      t.float :ph_max
      t.float :soil_moisture_min
      t.float :soil_moisture_max
      t.string :common_name
      t.string :moisture_use
      t.float :temperature_min

      t.timestamps
    end
  end
end
