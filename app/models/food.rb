class Food < ApplicationRecord
  has_one :meals_foods
  has_many :meals, through: :meals_foods
end
