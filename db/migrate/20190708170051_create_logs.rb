class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.belongs_to :action, foreign_key: true
      t.belongs_to :plant, foreign_key: true
      t.float :amount
      
      t.timestamps
    end
  end
end
