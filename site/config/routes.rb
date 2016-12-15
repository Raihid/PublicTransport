Rails.application.routes.draw do
  get 'schedule/index'
  root 'schedule#index'

  get 'lines/:line_id/:id' => 'lines#schedule'
  resources :lines
  resources :departures
  resources :stops
  resources :vehicles
  resources :drivers
  resources :scheduled


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
