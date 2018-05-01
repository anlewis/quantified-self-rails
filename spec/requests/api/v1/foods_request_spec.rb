require 'rails_helper'

describe "Foods API" do
  it "sends a list of foods" do
    food_1 = create(:food)
    food_2 = create(:food)

    get '/api/v1/foods'

    foods = JSON.parse(response.body)

    expect(response).to be_success
    expect(foods.count).to eq 2
    expect(foods[0]['id']).to eq food_1.id
    expect(foods[1]['id']).to eq food_2.id

    food = foods.first

    expect(food).to have_key "id"
    expect(food).to have_key "name"
    expect(food).to have_key "calories"

    expect(food).not_to have_key "created_at"
    expect(food).not_to have_key "updated_at"
  end

  it "can get one food by its id" do
    id = create(:food).id

    get "/api/v1/foods/#{id}"

    food = JSON.parse(response.body)

    expect(response).to be_success
    expect(food["id"]).to eq(id)

    expect(food).to have_key "id"
    expect(food).to have_key "name"
    expect(food).to have_key "calories"

    expect(food).not_to have_key "created_at"
    expect(food).not_to have_key "updated_at"
  end

  it "show returns 404 if food with requested id does not exist" do
    get "/api/v1/foods/1"

    expect(response.status).to eq 404
  end

  it "can create a new food" do
    food_params = { name: "Waffles", calories: 200 }

    post "/api/v1/foods", params: {food: food_params}
    food = Food.last

    expect(response).to be_success
    expect(food.name).to eq(food_params[:name])
    expect(food.calories).to eq(food_params[:calories])
  end

  it "can update an existing food" do
    id = create(:food, name: "Not a waffle").id
    previous_name = Food.last.name
    food_params = { name: "Waffle" }

    patch "/api/v1/foods/#{id}", params: {food: food_params}
    food = Food.find(id)

    expect(response).to be_success
    expect(food.name).to_not eq(previous_name)
    expect(food.name).to eq("Waffle")
  end

  it "can destroy an food" do
    id = create(:food).id

    expect(Food.count).to eq(1)

    delete "/api/v1/foods/#{id}"

    expect(response.status).to eq 204
    expect(Food.count).to eq(0)
    expect{Food.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "destroy returns 404 if food with requested id does not exist" do
    delete "/api/v1/foods/1"

    expect(response.status).to eq 404
  end
end