Rails.application.routes.draw do
   root to: "users#index"

    #get "/users", to: "users#index", as: "foo"
    get "/users", to: "users#index", as: "users"

    get "/users/new", to: "users#new", as: "new_user"

    post "/users", to: "users#create"

    get "/users/:id", to: "users#show", as: "user"

    get "/sign_in", to: "sessions#new"

    post "/sessions", to: "sessions#create"

    get "/libraries", to: "libraries#index"

    get "/libraries/new", to: "libraries#new", as: "new_library"

    post "/libraries", to: "libraries#create"

    get "/users/:user_id/libraries", to: "library_users#index", as: "user_libraries"

    post "/libraries/:library_id/users", to: "library_users#create", as: "library_users"

end

#   Prefix Verb URI Pattern          Controller#Action
#     root GET  /                    users#index
#    users GET  /users(.:format)     users#index
# new_user GET  /users/new(.:format) users#new
#          POST /users(.:format)     users#create
#     user GET  /users/:id(.:format) users#show
#  sign_in GET  /sign_in(.:format)   sessions#new
# sessions POST /sessions(.:format)  sessions#create
