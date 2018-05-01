class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end

  def update
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal.foods << food
    render json: { message: "Successfully added #{food.name} to #{meal.name}" }, status: 201
  rescue
    render status: 404
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    meal.foods.delete(food)
    render json: { message: "Successfully removed #{food.name} to #{meal.name}" }
  rescue
    render status: 404
  end
end