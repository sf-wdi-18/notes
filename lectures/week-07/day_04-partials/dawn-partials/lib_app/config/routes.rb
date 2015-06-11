Rails.application.routes.draw do
  root to: "users#index"

  get "/users", to: "users#index", as: "users"

  get "/users/new", to: "users#new", as: "new_user"

  post "/users", to: "users#create"

  get "/users/:id", to: "users#show"

  get "/sign_in", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/libraries", to: "libraries#index"

  get "/libraries/new", to: "libraries#new", as: "new_library"

  post "/libraries", to: "libraries#create"

  get "/users/:user_id/libraries"
end
