class Meal < ApplicationRecord
  has_and_belongs_to_many :foods
  validates :name, presence: true
  
  enum name: [ :snacks, :breakfast, :lunch, :dinner ]
end
