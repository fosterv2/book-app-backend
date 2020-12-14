Rails.application.routes.draw do
  resources :reviews, only: [:create, :update, :destroy]
  get '/reviews/:book_id', to: 'reviews#index'

  resources :books, only: [:index, :create, :update, :destroy]

  resources :users, only: [:show, :create, :update, :destroy]

  post '/auth', to: 'auth#create'
  get '/auth', to: 'auth#show'
end
