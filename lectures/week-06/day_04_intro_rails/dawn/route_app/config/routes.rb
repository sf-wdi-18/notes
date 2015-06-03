Rails.application.routes.draw do


  root to: 'planes#index'

  # just to be REST-ful
  get '/planes', to: 'planes#index'

  # get a single plane
  get '/planes/new', to: 'planes#new'

  # show a particular plane
  get '/planes/:id', to: 'planes#show'

  # a route to handle submitted planes
  post '/planes', to: 'planes#create'

end


