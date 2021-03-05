Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :workdays, only: [:index, :new, :create, :edit, :update]
  get 'workdays/on_leave', to: 'workdays#on_leave'
  get 'workdays/on_leave/:id', to: 'workdays#on_leave'
  get 'workdays/working/:id', to: 'workdays#working'
end
