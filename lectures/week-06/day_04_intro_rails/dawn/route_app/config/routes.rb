Rails.application.routes.draw do

  root to: 'planes#index'

  # get a single plane
  get 'planes/new', to: 'planes#new'

end
