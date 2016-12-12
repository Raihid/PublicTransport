Rails.application.routes.draw do
  get 'schedule/index'
  root 'schedule#index'

  resources :lines
  resources :departures
  resources :stops
  resources :vehicles
  resources :drivers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
