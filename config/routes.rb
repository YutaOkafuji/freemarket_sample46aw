Rails.application.routes.draw do

  root 'items#index'
  resources :users, only: %i[index new create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resource :user_addresses, only: %i[edit create new]
  resource :logouts, only: %i[show]
  resources :profiles, only: :new
  # 確認用（users/create）
  get'/users/create' => 'users#create'
  resources :items
  # usersをネストし、indexをshowに修正すること
  resources :credits, only: %i[index new]
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 

end
