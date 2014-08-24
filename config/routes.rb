Rails.application.routes.draw do
  root 'sessions#login'
  get 'sessions/login'
  post 'sessions/login_attempt'

  get 'sessions/logout'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  
end
