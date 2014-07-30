Rails.application.routes.draw do

  root 'access_keys#new'

  resources :access_keys, only: [ :new, :create ]

  namespace :api, defaults: { format: :json } do
    resources :appointments, only: [:create, :update, :destroy]
  end
end
