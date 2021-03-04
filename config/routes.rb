Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations"}

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/:id/edit', to: 'users#onboarding', as: 'onboarding'

  resources :users
end
