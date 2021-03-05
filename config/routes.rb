Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/onboarding', to: 'users#onboarding', as: 'onboarding'
  patch '/contract_update', to: 'users#contract_update', as: 'contract_update'
  get '/personal_details', to: 'users#personal_details', as: 'personal_details'
  patch '/personal_update', to: 'users#personal_update', as: 'personal_update'
  resources :users
  resources :workdays, only: [:index, :new, :create, :edit, :update]
  get 'workdays/on_leave', to: 'workdays#on_leave'
  get 'workdays/on_leave/:id', to: 'workdays#on_leave'
  get 'workdays/working/:id', to: 'workdays#working'

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
