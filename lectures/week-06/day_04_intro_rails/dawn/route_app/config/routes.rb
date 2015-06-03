Rails.application.routes.draw do

  root to: 'planes#index'

  # get a single plane
  get 'planes/new', to: 'planes#new'

  # a route to handle submitted planes
  post '/planes', to: 'planes#create'
end

