class Meal < ApplicationRecord
  has_many :foods

  enum type: [ :snack, :breakfast, :lunch, :dinner ]
end
