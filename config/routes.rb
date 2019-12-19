Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :blogs
  resources :favorites, only: [:create, :destroy]
end
