FactoryBot.define do
  factory :food do
    name "MyFood"
    calories Random.rand(0..2000)
    meal
  end
end