Rails.application.routes.draw do
  passwordless_for :companies
  mount Lockup::Engine, at: '/lockup'

  root 'jobs#index'

  resource :company, only: %i[edit update]
  resources :jobs, only: %i[index show new create]

  if false
    get 'payment', to: 'pages#payment'
  end
end
