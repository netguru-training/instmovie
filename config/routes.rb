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
  get 'movies/:id/add_tags', to: 'movies#add_tags', as: 'add_tags'
  #post 'movies/:id/create_tags', to: 'movies_create_tags', as: 'create_tags'
  get 'movies/:id/edit_tags', to: 'movies#edit_tags', as: 'edit_tags'
  #put 'movies/:id/update_tags', to: 'movies_update_tags', as: 'update_tags'

  get 'tags/ajax_get_list' => 'tags#ajax_get_list'

  get 'search/movies' => 'movies#search'

  get 'map/markers/:id' => 'map#markers'
  get 'movies/auctions/:id' => 'movies#auctions'
end
