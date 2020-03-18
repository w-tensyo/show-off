Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:show,:update]
  resources :posts, except: :index

end
