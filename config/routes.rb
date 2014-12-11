Rails.application.routes.draw do
  resources :queries

  resources :guests, except: :show

  resources :properties, except: :show

  resources :areas

  root to: 'guests#new'
  devise_for :users
  resources :users

  match '/dashboard', 	to: 'users#show', 		via: 'get'
  match '/results',   	to: 'guests#show',      via: 'get'
end
