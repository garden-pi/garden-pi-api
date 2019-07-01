class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :number_fruit
      t.float :height
      t.integer :overall_health
      t.text :notes
      t.belongs_to :plant, foreign_key: true

      t.timestamps
    end
  end
end
