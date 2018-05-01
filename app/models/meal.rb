class Meal < ApplicationRecord
  has_and_belongs_to_many :foods
  
  enum name: [ :snack, :breakfast, :lunch, :dinner ]
end
