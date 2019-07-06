Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  } 
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show new] do
    resource  :user_addresses, only: %i[edit new create] 
    resource  :logouts, only: %i[show]
    resources :profiles, only: :new
    resources :credits, only: %i[index new create]
    resource  :members, only: %i[show]
  end
  resources :items
  # usersをネストし、indexをshowに修正すること

end
