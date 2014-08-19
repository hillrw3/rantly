Rails.application.routes.draw do
  root "rants#splash"

  resources :rants
  resources :sessions
  resources :users
end
