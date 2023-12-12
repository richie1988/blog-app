Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show], controller: 'posts', as: 'user_posts'
  end
end
