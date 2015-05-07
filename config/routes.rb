Rails.application.routes.draw do

  resources :guests
  resources :queries
  # resources :prequals (removed prequal model on 4/13)

  resources :areas
  resources :properties, except: :show

  root to: 'guests#new'
  devise_for :users
  resources :users

  match '/dashboard', 	      to: 'users#show', 		           via: 'get'
  match '/step2',   	        to: 'guests#step2',              via: 'get'
  match '/step3',             to: 'guests#step3',              via: 'get'
  match '/step4',             to: 'guests#step4',              via: 'get'
  match '/results',           to: 'guests#results',            via: 'get'
  match '/final',             to: 'guests#final',              via: 'get'
  match '/privacy-policy',   	to: 'pages#privacy_policy',      via: 'get'
  match '/fair-housing',   		to: 'pages#fair_housing',      	 via: 'get'

end
