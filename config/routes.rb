Rails.application.routes.draw do

  devise_for :users

  root "items#index"

  # root to: 'articles#index' 

  resources :users,only: [:edit,:update]
  resources :items,only: [:index,:new,:edit,:show,:create]
  resources :articles
end
