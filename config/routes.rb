Rails.application.routes.draw do
  devise_for :users
  root to: 'merchandises#index'
  resources :merchandises, only: [:index, :new ,:create, :show]
end
