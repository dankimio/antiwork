Rails.application.routes.draw do
  passwordless_for :companies
  mount Lockup::Engine, at: '/lockup'

  root 'pages#index'

  resources :jobs, only: %i[new]

  get 'new-advert', to: 'pages#new'
  get 'job-description', to: 'pages#job_description'
  get 'company-info', to: 'pages#company_info'
  get 'payment', to: 'pages#payment'
  get 'show', to: 'pages#show'
end
