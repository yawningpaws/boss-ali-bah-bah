Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}

  root to: 'pages#home'
  get '/calendar', to: 'pages#calendar'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accidents do
    member do
      get :new3
      get :complete
    end
  end
  post '/accidents/send', to: 'accidents#send_accident'

  get '/onboarding', to: 'users#onboarding', as: 'onboarding'
  get '/landing', to: 'pages#landing'
  patch '/contract_update', to: 'users#contract_update', as: 'contract_update'
  get '/personal_details', to: 'users#personal_details', as: 'personal_details'
  patch '/personal_update', to: 'users#personal_update', as: 'personal_update'
  resources :users
  resources :workdays, only: [:new, :create, :edit, :update]
  get 'workdays/on_leave', to: 'workdays#on_leave'
  get 'workdays/on_leave/:id', to: 'workdays#on_leave'
  get 'workdays/working/:id', to: 'workdays#working'
  get 'workday_notification', to: 'workdays#notifications'
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  resources :payslips, only: [:new, :create, :edit, :update]
end
