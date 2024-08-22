Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :update] do
    resources :follow_requests, only: [:create]
  end
  resources :follow_requests, only: [:destroy]
  
  resources :posts do 
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  root 'posts#index'
end
