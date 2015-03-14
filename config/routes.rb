Rails.application.routes.draw do
  resources :reviews

  devise_for :users, controllers: {
     omniauth_callbacks: 'users/omniauth_callbacks'
 }

  resources :movies

  root 'application#index'

  get 'users/profile'
  get 'users/admin'
end
