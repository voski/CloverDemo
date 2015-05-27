Rails.application.routes.draw do
  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :clover, only: [:index]

  get 'clover/callback', to: 'clover#callback'


end
