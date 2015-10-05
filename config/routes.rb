Rails.application.routes.draw do

  resources :contacts, only: [:new, :create]

  mount Optimadmin::Engine => "/admin"
  root to: 'application#index'
end
Optimadmin::Engine.routes.draw do
end