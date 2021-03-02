Rails.application.routes.draw do

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signup' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  get 'authorized' => 'sessions#page_requires_login'
  root 'users#index'

  resources :users
  resources :wishlists
  resources :sessions

end
