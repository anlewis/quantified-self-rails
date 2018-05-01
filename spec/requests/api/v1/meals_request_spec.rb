require 'rails_helper'

describe "Meals API" do
  it "gets all meals and associated foods" do
    meal_1 = create(:meal)
    meal_2 = create(:meal)

    food_1 = create(:food)
    food_2 = create(:food)
    food_3 = create(:food)

    meal_1 << food_1
    meal_1 << food_2

    meal_2 << food_2
    meal_2 << food_3
    
    get '/api/v1/meals'

    meals = JSON.parse(response.body)

    expect(response).to be_success
    expect(meals.count).to eq(2)
  end

  it "can get one meal and associated foods by its id" do
    meal = create(:meal)
    food_1 = create(:food)
    food_2 = create(:food)
    food_3 = create(:food)

    meal << food_1
    meal << food_2
    meal << food_3

    get "/api/v1/meals/#{meal.id}/foods"

    meal_response = JSON.parse(response.body)

    expect(meal_response).to be_success
    expect(meal_response.id).to eq(meal.id)
  end

  it "can add a food to a meal" do
    meal = create(:meal)
    food = create(:food, name: "Waffles", calories: 200)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"
    meal = Meal.last

    expect(response).to be_success
    expect(meal.food.name).to eq("Waffles")
  end

  it "can remove a food from a meal" do
    meal = create(:meal)
    food_1 = create(:food)
    food_2 = create(:food)

    meal << food_1
    meal << food_2

    expect(Meal.foods.count).to eq(2)

    delete " /api/v1/meals/#{meal.id}/foods/#{food_1.id}"

    expect(response).to be_success
    expect(meal.foods.count).to eq(1)
    expect{meal.foods.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end