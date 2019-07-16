Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'items#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new show] do
    resource  :user_addresses, only: %i[new create edit] 
    resource  :delivery_addresses, only: %i[new create edit update]
    resource  :logouts, only: %i[show]
    resources :profiles, only: :new
    resource  :credits, only: %i[show new create]
    resource  :members, only: %i[show]
  end
  resources :items
  # usersをネストし、indexをshowに修正すること

end
