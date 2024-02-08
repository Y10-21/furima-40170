Rails.application.routes.draw do
  devise_for :users
  root to: 'merchandises#index'
  resources :merchandises
  resources :merchandises, only: :purchase do
    post 'purchase', on: :member
  end
  resources :merchandises do
    resources :purchases 
  end
end
