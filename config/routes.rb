Rails.application.routes.draw do
 
  root "rants#splash"

  get 'signout' => 'sessions#destroy', as: :signout
  resources :rants
  resources :sessions
  resources :users
  resources :followers
  resources :search, only: :index
  resources :favorited_rants
  resources :comments, only: :create
  resource :admins, only: :show

end
