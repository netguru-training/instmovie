Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :reviews

  devise_for :users, controllers: {
     omniauth_callbacks: 'registrations/omniauth_callbacks'
 }

  resources :movies

  root 'application#index'

  get 'users/profile'
  get 'users/admin'

  get 'search/movies' => 'movies#search'
end
