class AddLoggingEnabledToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :logging_enabled, :boolean, default: false
  end
end
