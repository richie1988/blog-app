# config/routes.rb

Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
  end
  # root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Add the following line to define the route for user photos
  # get 'users/:id/photo', to: 'photos#show', as: 'user_photo'
end
