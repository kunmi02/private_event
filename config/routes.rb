Rails.application.routes.draw do
  root to: 'users#sign_in'
  resources :users, only: %i[show new create index]
  get 'log-in', to: 'session#log_in'
  delete 'log-out', to: 'session#log_out'

end
