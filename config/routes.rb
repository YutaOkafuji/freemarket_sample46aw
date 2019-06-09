Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :profiles, only: :new
  resources :users, only: :index
end
