Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, shallow: true do
    get :my_favorite, on: :member # idが必要なときはmember,そうでないときはcollection
  end
  
  resources :blogs do
    collection do
      post :confirm
      patch :confirm
    end
    member do
      patch :confirm
    end
  end

  resources :favorites, only: [:create, :destroy]
end
