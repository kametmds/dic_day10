Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
