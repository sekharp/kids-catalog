Rails.application.routes.draw do
  root to: 'home#index'
  resources :books
  resources :users, only: %i[new create update]
  resources :favorites, only: %i[create update]
  get '/all_books', to: 'books#all'
  get '/auth/google_oauth2', as: 'oauth'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  get '/dashboard', to: 'users#show'
  get '/dashboard/edit', to: 'users#edit'
  put '/dashboard', to: 'users#update'

  get '*unmatched_route', to: 'application#not_found'
end
