class Food < ApplicationRecord
  belongs_to :meal, optional: true
end
