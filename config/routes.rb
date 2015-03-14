Rails.application.routes.draw do
  resources :reviews

  devise_for :users

  resources :movies

  root 'application#index'

  get 'users/profile'
  get 'users/admin'
end
