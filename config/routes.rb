Rails.application.routes.draw do


  root 'welcome#home'

  get '/signin', to: 'sessions#new'

  post '/signin', to: 'sessions#create'

  get 'logout' => 'sessions#destroy'

  post '/rides/create', to: 'rides#create'

  resources :attractions
  resources :users

end
