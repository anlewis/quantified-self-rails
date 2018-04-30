FactoryBot.define do
  factory :meal do
    type Random.rand(0..3)
  end
end