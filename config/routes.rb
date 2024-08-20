Rails.application.routes.draw do
  devise_for :users

  resources :users
  
  resources :posts do 
    resources :likes, only: [:create, :destroy]
  end

  root 'posts#index'
end
