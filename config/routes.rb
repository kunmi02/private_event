Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: %i[show new create index]
  get 'sign-in', to: 'users#sign_in'
  post 'log-in', to: 'users#log_in'
end
