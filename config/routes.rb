Rails.application.routes.draw do
  root 'dates#index'
  resources :dates

  get '/ping', to: 'application#ping'
end
