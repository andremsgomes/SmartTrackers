Rails.application.routes.draw do
  devise_for :users
  resources :gauges
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'gauges#index'
  get 'gauges', to: 'gauges#index'
  get '/gauges/show/:id', to: 'gauges#show', as: 'gauges_show'
  get '/gauges/:id/gauge_entries/new', to: 'gauge_entries#new', as: 'gauge_entries_new'
  post '/gauge_entries', to: 'gauge_entries#create'
  get 'gauges/new', to: 'gauges#new', as: 'gauges_new'
  post 'gauges', to: 'gauges#create'
  post '/gauge_entries/approve', to: 'gauge_entries#approve'
end
