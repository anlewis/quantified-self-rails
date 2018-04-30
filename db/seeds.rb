require 'faker'

Food.destroy_all
Meal.destroy_all

Meal.create!(id: 1, name: 0)
Meal.create!(id: 2, name: 1)
Meal.create!(id: 3, name: 2)
Meal.create!(id: 4, name: 3)

puts "Created #{Meal.count} meals"

50.times do |index|
  Food.create!(name: Faker::Food.dish, calories: Random.rand(0..2000), meal: Meal.find(Random.rand(1..4)))
end

puts "Created #{Food.count} foods"