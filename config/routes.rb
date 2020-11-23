Rails.application.routes.draw do
  resources :reviews, only: [:create, :update, :destroy]
  resources :books, only: [:index, :create, :update, :destroy]
  resources :users, only: [:show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
