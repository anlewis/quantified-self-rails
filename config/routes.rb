Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, except: [:new, :edit]
      resources :meals, only: [:index]
      get '/meals/:meal_id/foods', to: 'meals#show'
      post '/meals/:meal_id/foods/:id', to: 'meals#update'
    end
  end
end
