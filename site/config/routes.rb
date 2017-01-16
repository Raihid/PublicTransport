Rails.application.routes.draw do
  get 'contact/index'

  get 'schedule/index'
  root 'schedule#index'


  get 'schedule/advanced/' => 'schedule#advanced'
  post 'schedule/results/' => 'schedule#results'
  get 'lines/:line_id/:id' => 'lines#schedule'
  get 'stops/search/:name' => 'stops#search'
  get 'drivers/search/' => 'drivers#search'
  get 'difficulties/search/' => 'difficulties#search'
  get 'departures/pickline/' => 'departures#pickline'
  get 'departures/new/:line/' => 'departures#new'
  get 'contact' => 'contact#index'
  resources :lines
  resources :departures
  resources :stops
  resources :vehicles
  resources :drivers
  resources :difficulties


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
