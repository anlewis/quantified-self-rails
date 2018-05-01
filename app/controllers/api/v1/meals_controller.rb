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
    render json: meal.foods << food
  end

  def destroy
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    render json: meal.foods.delete(food)
  end

  private

    def meal_params
      params.require(:meal).permit(:name)
    end
end