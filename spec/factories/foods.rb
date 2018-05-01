FactoryBot.define do
  factory :food do
    name Faker::Food.dish
    calories Random.rand(0..2000)
  end
end