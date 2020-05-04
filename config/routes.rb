Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/create'
  get 'messages/destroy'
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: [:create]
  end
  namespace :api do
    # categoryを利用するためにnamespaceで個別に設定
    get '/children_category' ,to: 'categories#children_category'
  end
  resources :users, only: [:show,:update,] do
    resources :messages, only: [:index, :create, :destroy]
    member do
      post :follow_list
    end
  end
  resources :relationships, only: [:create, :destroy]
end
