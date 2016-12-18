Rails.application.routes.draw do
  get 'schedule/index'
  root 'schedule#index'

  get 'lines/:line_id/:id' => 'lines#schedule'
  get 'drivers/search/:name' => 'drivers#search'
  resources :lines
  resources :departures
  resources :stops
  resources :vehicles
  resources :drivers
  resources :difficulties


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
