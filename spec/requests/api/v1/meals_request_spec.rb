require 'rails_helper'

describe "Meals API" do
  it "gets all meals and associated foods" do
    meal_1 = create(:meal)
    meal_2 = create(:meal)

    food_1 = create(:food)
    food_2 = create(:food)
    food_3 = create(:food)

    meal_1.foods << food_1
    meal_1.foods << food_2

    meal_2.foods << food_2
    meal_2.foods << food_3
    
    get '/api/v1/meals'

    meals = JSON.parse(response.body)

    expect(response).to be_success
    expect(meals.count).to eq(2)

    meal = meals.first

    expect(meal).to have_key "id"
    expect(meal).to have_key "name"
    expect(meal).to have_key "foods"

    expect(meal).not_to have_key "created_at"
    expect(meal).not_to have_key "updated_at"

    food = meal["foods"].first

    expect(food).to have_key "id"
    expect(food).to have_key "name"
    expect(food).to have_key "calories"

    expect(food).not_to have_key "created_at"
    expect(food).not_to have_key "updated_at"
  end

  it "can get one meal and associated foods by its id" do
    meal = create(:meal)
    food_1 = create(:food)
    food_2 = create(:food)
    food_3 = create(:food)

    meal.foods << food_1
    meal.foods << food_2
    meal.foods << food_3

    get "/api/v1/meals/#{meal.id}/foods"

    meal_response = JSON.parse(response.body)
  
    expect(response).to be_success
    expect(meal_response['id']).to eq(meal.id)

    food = meal_response['foods'].first

    expect(food).to have_key "id"
    expect(food).to have_key "name"
    expect(food).to have_key "calories"

    expect(food).not_to have_key "created_at"
    expect(food).not_to have_key "updated_at"
  end

  it "can add a food to a meal" do
    meal = create(:meal, name: 1)
    food = create(:food, name: "Waffles", calories: 200)

    post "/api/v1/meals/#{meal.id}/foods/#{food.id}"
    meal = Meal.last

    expect(response).to be_success
    expect(response.status).to eq 201
    expect(meal.foods.first.name).to eq("Waffles")

    message_hash = JSON.parse(response.body)
    expect(message_hash["message"]).to eq "Successfully added #{food.name} to #{meal.name}"
  end

  it "post returns 404 if meal doesn't exist" do
    food = create(:food)

    post "/api/v1/meals/1/foods/#{food.id}"

    expect(response.status).to eq 404
  end

  it "psot returns 404 if food doesn't exist" do
    meal = create(:meal)

    post "/api/v1/meals/#{meal.id}/foods/1"

    expect(response.status).to eq 404
  end

  it "can remove a food from a meal" do
    meal = create(:meal)
    food_1 = create(:food)
    food_2 = create(:food)

    meal.foods << food_1
    meal.foods << food_2

    expect(meal.foods.count).to eq(2)

    delete "/api/v1/meals/#{meal.id}/foods/#{food_1.id}"

    expect(response).to be_success
    expect(meal.foods.count).to eq(1)

    message_hash = JSON.parse(response.body)
    expect(message_hash["message"]).to eq "Successfully removed #{food_1.name} to #{meal.name}"
  end

  it "delete returns 404 if meal doesn't exist" do
    food = create(:food)

    delete "/api/v1/meals/1/foods/#{food.id}"

    expect(response.status).to eq 404
  end

  it "psot returns 404 if food doesn't exist" do
    meal = create(:meal)

    delete "/api/v1/meals/#{meal.id}/foods/1"

    expect(response.status).to eq 404
  end
end