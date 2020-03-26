Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show,:update,] do
    member do
      post :follow_list
    end
  end
  resources :relationships, only: [:create, :destroy]
end
