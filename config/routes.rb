Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 
  
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # usersをネストし、indexをshowに修正すること
  resources :credits, only: %i[index new edit]
  get'/users/create' => 'users#create'
  resources :users, only: %i[show new] do
    resource  :logouts,        only: %i[show destroy]
    resource  :profiles,       only: %i[new]
    resources :items,          only: %i[index show new ]
    resource  :user_addresses, only: %i[edit create new]
    resource  :credits,        only: %i[show new]
  end
end
