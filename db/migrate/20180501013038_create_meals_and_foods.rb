class CreateMealsAndFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.timestamps
    end

    create_table :meals_foods do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :food, index: true
    end
  end
end
