Rails.application.routes.draw do
  root 'sessions#new'
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
end
