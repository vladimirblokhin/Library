Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  root 'books#index'

  resources :books do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  resources :authors, only: [:create]
end
