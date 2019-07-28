Rails.application.routes.draw do
  mount Lockup::Engine, at: '/lockup'

  root 'pages#index'

  get 'new-advert', to: 'pages#new'
  get 'job-description', to: 'pages#job_description'
  get 'company-info', to: 'pages#company_info'
  get 'payment', to: 'pages#payment'
end
