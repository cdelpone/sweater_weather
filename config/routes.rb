Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :backgrounds, only: :index
      resources :users, only: :create
      resources :road_trip, only: :create
      resources :sessions, only: [:create, :destroy]
    end
  end
end
