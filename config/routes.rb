Rails.application.routes.draw do
  root 'users#index'
  get 'posts/:id', to: 'posts#show', as: 'post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:id', to: 'users#show', as: 'user'

  # root 'articles#index'
  # get '/articles', to: 'articles#index'
end
