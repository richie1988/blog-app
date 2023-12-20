# config/routes.rb

Rails.application.routes.draw do
  devise_for :users, { registrations: 'devise/sessions#new' }

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Add the following line to define the route for user photos
  # get 'users/:id/photo', to: 'photos#show', as: 'user_photo'
end
