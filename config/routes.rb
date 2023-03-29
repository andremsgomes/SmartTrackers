Rails.application.routes.draw do
  resources :gauges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "gauges#index"
  get "/gauges/show/:id", to: "gauges#show"
  get "/gauges/:id/gauge_entries/new", to: "gauge_entries#new", as: 'gauge_entries_new'
  post "/gauge_entries", to: "gauge_entries#create"
end
