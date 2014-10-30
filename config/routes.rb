Rails.application.routes.draw do
 
  root "rants#splash"

  get 'signout' => 'sessions#destroy', as: :signout
  get '/admins/users' => 'admins#users'
  get '/admins/rants' => 'admins#rants'
  get '/admins/spam' => 'admins#spam'
  get 'disable/:id' => 'admins#disable', as: :disable
  post 'spam/:id' => 'spam#create', as: :spam
  delete 'spam/:id' => 'spam#destroy', as: :not_spam
  get '/confirmations' => 'confirmations#show', as: :confirmation

  resources :rants
  resources :sessions
  resources :users
  resources :followers
  resources :search, only: :index
  resources :favorited_rants
  resources :comments, only: :create
  resource :admins, only: :show

end
