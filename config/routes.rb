Rails.application.routes.draw do
  root to: 'home#index'
  resources :books
  get '/all_books', to: 'books#all'
end
