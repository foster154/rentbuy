Rails.application.routes.draw do

  resources :guests
  resources :queries
  resources :prequals

  resources :areas
  resources :properties, except: :show

  root to: 'guests#new'
  devise_for :users
  resources :users

  match '/dashboard', 	to: 'users#show', 		via: 'get'
  match '/results',   	to: 'guests#edit',      via: 'get'
  match '/privacy-policy',   	to: 'pages#privacy_policy',      via: 'get'
  match '/fair-housing',   		to: 'pages#fair_housing',      	 via: 'get'

end
