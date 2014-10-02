Rails.application.routes.draw do
 
  root "rants#splash"

  get 'signout' => 'sessions#destroy', as: :signout
  resources :rants
  resources :sessions
  resources :users
  resources :followers
  resource :search, only: :index
end
