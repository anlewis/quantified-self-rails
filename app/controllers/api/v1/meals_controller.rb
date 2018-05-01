class Api::V1::MealsController < ApplicationController
  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params[:meal_id])
  end

  private

    def meal_params
      params.require(:meal).permit(:name)
    end
end