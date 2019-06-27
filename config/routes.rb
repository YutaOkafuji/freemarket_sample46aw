Rails.application.routes.draw do

  devise_for :users
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: :index do
    resource  :logouts,        only: %i[show destroy]
    resource  :profiles,       only: %i[new]
    resources :items,          only: %i[index show new ]
    resource  :user_addresses, only: %i[edit create]
    resources :credits,        only: %i[index new]
    # usersをネストし、indexをshowに修正すること
  end
end
