class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.string :action_type
      t.string :unit

      t.timestamps
    end
  end
end
