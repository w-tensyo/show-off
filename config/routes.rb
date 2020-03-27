Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  get 'messages/destroy'
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show,:update,] do
    resources :messages, only: [:index, :create, :destroy]
    member do
      post :follow_list
    end
  end
  resources :relationships, only: [:create, :destroy]
end
