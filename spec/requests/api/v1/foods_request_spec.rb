require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    create_list(:food, 3)

    get '/api/v1/foods'

    foods = JSON.parse(response.body)

    expect(response).to be_success
    expect(foods.count).to eq(3)
  end

  it "can get one food by its id" do
    id = create(:food).id

    get "/api/v1/foods/#{id}"

    food = JSON.parse(response.body)

    expect(response).to be_success
    expect(food["id"]).to eq(id)
  end

  it "can create a new food" do
  food_params = { name: "Waffles", calories: 200 }

  post "/api/v1/foods", params: {food: food_params}
  food = Food.last

  expect(response).to be_success
  expect(food.name).to eq(food_params[:name])
  expect(food.calories).to eq(food_params[:calories])
end
end