class Meal < ApplicationRecord
  has_one :meals_foods
  has_many :foods, through: :meals_foods

  enum name: [ :snack, :breakfast, :lunch, :dinner ]
end
