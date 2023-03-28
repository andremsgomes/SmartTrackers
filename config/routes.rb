Rails.application.routes.draw do
  resources :gauges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "gauges#index"
  get "/gauges/show/:id", to: "gauges#show"
end
