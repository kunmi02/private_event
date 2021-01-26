Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: %i[show new create]
  get 'sign-in', to: 'users#sign_in'
  # post 'sign-in', to: 'users#log_in'
end
