Rails.application.routes.draw do
  resources :areas

  root to: 'pages#home'
  devise_for :users
  resources :users

  match '/dashboard', to: 'users#show', via: 'get'
end
