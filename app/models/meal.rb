class Meal < ApplicationRecord
  has_many :foods

  enum name: [ :snack, :breakfast, :lunch, :dinner ]
end
