Rails.application.routes.draw do
  root 'pages#home'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  namespace :admin do
    root 'pages#home'
    resources :users
  end

  resources :users, expect: [:new, :create, :destroy]
end