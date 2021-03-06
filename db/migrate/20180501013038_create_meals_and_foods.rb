class CreateMealsAndFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.integer :name
      t.timestamps
    end
 
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.timestamps
    end

    create_table :foods_meals do |t|
      t.belongs_to :meal, index: true
      t.belongs_to :food, index: true
    end
  end
end
