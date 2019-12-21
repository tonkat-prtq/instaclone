Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, shallow: true do
    get :my_favorite, on: :member # idが必要なときはmember,そうでないときはcollection
  end
  resources :blogs
  resources :favorites, only: [:create, :destroy]
end
