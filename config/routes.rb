Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'items#index'
  resources :users, only: %i[show new] do
    resource :user_addresses, only: %i[edit new create] 
    resource :logouts, only: %i[show]
    resources :profiles, only: :new
    resource :cards, only: %i[show new create]
    resource :members, only: %i[show]
    resource :delivery_addresses, only: %i[edit new create]
  end
  resources :items
end
