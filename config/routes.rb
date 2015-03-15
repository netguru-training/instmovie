Rails.application.routes.draw do
  get 'map/show'

  post '/rate' => 'rater#create', :as => 'rate'

  devise_for :users, controllers: {
     omniauth_callbacks: 'registrations/omniauth_callbacks'
 }

  resources :movies do
    resources :reviews
  end

  root 'application#index'

  get 'users/profile'
  get 'users/admin'

  get 'search/movies' => 'movies#search'

  get 'map/markers/:id' => 'map#markers'
end
