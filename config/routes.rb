Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}

  root to: 'pages#home'
  get '/calendar', to: 'pages#calendar'

  get '/accidents/confirm', to: 'accidents#confirm'
  post '/accidents/send', to: 'accidents#send_accident'
  post '/workdays/send', to: 'workdays#send_worklog'
  post '/payslips/send', to: 'payslips#send_payslip'
  post '/users/send', to: 'users#send_ipa'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accidents do
    member do
      get :new3
      get :complete
    end
  end

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
  get 'organisation', to: 'organisations#index'
  get 'faq', to: 'organisations#faq'
  resources :payslips, only: [:new, :create, :edit, :update]
  get '/files', to: 'pages#files'
end
