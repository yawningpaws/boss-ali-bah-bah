Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :workdays, only: [:new, :create, :edit, :update]
  get 'workdays/on_leave', to: 'workdays#on_leave'
end
