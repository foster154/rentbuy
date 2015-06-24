Rails.application.routes.draw do

  #get 'email_settings/edit'
  #get 'email_settings/update'
  resources :email_settings, only: [ :edit, :update ]

  resources :guests
  resources :queries
  # resources :prequals (removed prequal model on 4/13)

  resources :areas
  resources :properties, except: :show

  root to: 'guests#new'
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users

  # Front End
  match '/dashboard', 	      to: 'users#show', 		           via: 'get'
  match '/step2',   	        to: 'guests#step2',              via: 'get'
  match '/step3',             to: 'guests#step3',              via: 'get'
  match '/step4',             to: 'guests#step4',              via: 'get'
  match '/results',           to: 'guests#results',            via: 'get'
  match '/final',             to: 'guests#final',              via: 'get'
  match '/privacy-policy',   	to: 'pages#privacy_policy',      via: 'get'
  match '/fair-housing',   		to: 'pages#fair_housing',      	 via: 'get'
  match '/calculator',        to: 'pages#calculator',          via: 'get'

  # Back End
  match '/profile',           to: 'users#edit',                via: 'get'
  match '/email_settings',    to: 'email_settings#edit',       via: 'get'

end
