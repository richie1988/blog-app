Rails.application.routes.draw do
  # config/routes.rb
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show], controller: 'posts', as: 'user_posts'
  end
end
