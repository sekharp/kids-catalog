Rails.application.routes.draw do
  root to: 'home#index'
  resources :books
  resources :users, only: [:new, :create, :update]
  get '/all_books', to: 'books#all'
  get '/auth/google_oauth2', as: 'oauth'
  get "/auth/google_oauth2/callback", to: "sessions#create"
  get '/login', to: 'sessions#new'
  delete '/logout', to: "sessions#destroy"
  get '/dashboard', to: 'users#show'
  get '/dashboard/edit', to: "users#edit"
end
