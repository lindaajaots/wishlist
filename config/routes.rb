Rails.application.routes.draw do
root to: "wishlists#index"
  resources :wishlists
  resources :things
  resources :users


get '/sign_in', to: 'users#sign_in'
post '/sign_in', to:'users#sign_in!'
get '/sign_up', to: 'users#sign_up'
post '/sign_up', to: 'users#sign_up!'
delete '/logout', to: 'users#sign_out'
get 'authorized', to: 'users#page_requires_sign_in'

end
