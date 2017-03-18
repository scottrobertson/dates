Rails.application.routes.draw do
  root 'dates#index'
  resources :dates
end
