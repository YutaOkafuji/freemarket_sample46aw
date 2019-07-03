Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: %i[show] do
    resource  :logouts,        only: %i[show destroy]
    resource  :profiles,       only: %i[new] 
    resources :items,          only: %i[index show new destroy]
    resource  :user_addresses, only: %i[edit create]
    resource  :credits,        only: %i[show new]
  end
end
