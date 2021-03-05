Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accidents do
    member do
      get :new3
      get :complete
    end
  end

  # get '/accidents/new', to: 'accidents#new'
  # post '/accidents/new', to: 'accidents#create'
  # get '/accidents/new2', to: 'accidents#new2'
  # patch '/accidents/new2.:id', to: 'accidents#new3'
  # patch '/accidents/new3.:id', to: 'accidents#complete', as: 'accidents_new3'
  # get '/accident', to: 'accidents#new3'
end
