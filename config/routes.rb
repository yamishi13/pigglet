Rails.application.routes.draw do
  root 'sessions#login'
  get 'login', to: 'sessions#login'
  get 'sessions/login'
  post 'sessions/login_attempt'
  get 'logout', to: 'sessions#logout'
  get 'sessions/logout'

  get 'home', to: 'sessions#home'
  get 'sessions/home'

  get 'sessions/profile'

  resources :deposits, only: [:index, :new, :create, :show]

  resources :withdrawals, only: [:index, :new, :create, :show]

  resources :statistics, only: [:index]
  
end
