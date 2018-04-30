class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.references :meal, foreign_key: true

      t.timestamps
    end
  end
end
