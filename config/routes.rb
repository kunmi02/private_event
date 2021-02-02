Rails.application.routes.draw do
  resources :events
  
  root to: 'users#sign_in'
  resources :users, only: %i[show new create index]
  resources :attendee, only: %i[show new create index]
  # get "/articles", to: "attendee#show"
  get 'log-in', to: 'session#log_in'
  post '/attendee/new', to:'attendee#create'
  delete 'log-out', to: 'session#log_out'
end
