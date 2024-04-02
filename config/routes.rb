Rails.application.routes.draw do
  root to: 'home#index'
  resources :genres, :directors, :movies
end
