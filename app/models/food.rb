class Food < ApplicationRecord
  has_and_belongs_to_many :meals
  validates :name, presence: true
  validates :calories, presence: true
end
