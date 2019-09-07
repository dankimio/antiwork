Rails.application.routes.draw do
  passwordless_for :companies
  mount Lockup::Engine, at: '/lockup'

  root 'pages#index'

  resource :company, only: %i[edit update]
  resources :jobs, only: %i[new create]

  get 'payment', to: 'pages#payment'
  get 'show', to: 'pages#show'
end
