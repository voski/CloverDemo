Rails.application.routes.draw do
  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :clover, only: [:show]

  get 'clover/callback', to: 'clover#callback'
  get 'clover/authorize', to: 'clover#authorize'


end
