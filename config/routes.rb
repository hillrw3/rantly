Rails.application.routes.draw do
 
  root "rants#splash"

  get 'signout' => 'sessions#destroy', as: :signout
  get '/admins/users' => 'admins#users'
  get '/admins/rants' => 'admins#rants'
  get 'disable/:id' => 'admins#disable', as: :disable

  resources :rants
  resources :sessions
  resources :users
  resources :followers
  resources :search, only: :index
  resources :favorited_rants
  resources :comments, only: :create
  resource :admins, only: :show

end
