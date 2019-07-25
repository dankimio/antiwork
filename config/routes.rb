Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'

  root 'pages#index'
end
