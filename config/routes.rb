Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :workdays, only: [:new, :create, :edit, :update]
  get 'workdays/not_working', to: 'workdays#not_working'
end
