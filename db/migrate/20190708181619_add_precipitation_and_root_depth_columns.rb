class AddPrecipitationAndRootDepthColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :species, :precipitation_min, :float
    add_column :species, :precipitation_max, :float
    add_column :species, :root_depth_min, :float
  end
end
