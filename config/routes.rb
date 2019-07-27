Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'

  root 'pages#index'

  get 'new-post', to: 'pages#new'
end
