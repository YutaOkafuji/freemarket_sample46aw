Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :logouts, only: %i[show destroy]
  resource :deals, only: %i[new]
  resources :profiles, only: :new
  resources :users, only: :index
  # usersのネストにし、indexをshowに修正すること
  resources :credits, only: %i[index new]
  resources :items, only: :new
end
