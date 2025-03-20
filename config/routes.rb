Rails.application.routes.draw do
  root "rooms#search"
  
  devise_for :users
  namespace :users do
    get 'profile', to: 'profile#show'
    get 'profile/edit'
    patch 'profile/update'
    
    get 'account', to: 'account#show'
  end
  
  get "rooms/own", to: "rooms#own"
  resources :rooms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
