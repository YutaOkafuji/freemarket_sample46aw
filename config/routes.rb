Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :user_addresses, only: %i[edit create]
  resource :logouts, only: %i[show destroy]
  resources :profiles, only: :new
  resources :users, only: :index
  resources :items
  # usersをネストし、indexをshowに修正すること
  resources :credits, only: %i[index new]
end
