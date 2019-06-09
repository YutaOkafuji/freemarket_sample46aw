Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :logouts, only: %i[show destroy]
  resources :profiles, only: :new
  resources :users, only: :index
  resources :items, only: :new
end
