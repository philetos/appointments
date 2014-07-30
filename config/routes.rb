Rails.application.routes.draw do

  root 'access_keys#new'

  resources :access_keys, only: [ :new, :create ]
end
