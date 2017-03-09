Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  resources :books do
    resources :comments, only: [:create, :destroy]
    resources :lists, only: [:create, :destroy]
    resources :rates, only: [:create]
  end

  resources :users, only: [:show, :edit, :update]

  resources :authors, only: [:create]
end
