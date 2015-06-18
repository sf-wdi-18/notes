# OAuth 2 API

Before anything you should sign up for the `instagram` api.

## Getting Started With `Instagram` Gem

`Gemfile`

```

## Add Instagram 
gem "instagram", "1.1.3" 

```

then `bundle install` that `sh@#`.


We can start by adding some logic to our `SessionsController` to do a 
basic sign in using the `Instagram` Gem.



```
OAuth 2 Strategy with Instagram

Rails App
  SessionsController                                  Instagram
-----------------------                         ------------------------
|	#oauth_connect    | -- 1. Authorize App -> |                         |
|                     |       and Authenticate |    2.Instagram          |
|                     |         user           |     authenticates user  |
|	#oauth_callback     |<-- 3. Response ----- |	   authorizes app    |
|   4.a Use `code`    |       with             |                         |
|       to ask        |       a `code`         |                         |
|       Instagram     |                        |                         |
|       for user      | -- 4.b POSTing to ---->|   4.c.  Generates       |       
|       access_token  |  /oauth/access_token   |       An Access         | 
|                     |    with `code`         |       Token             |
|                     |                        |          |              |
|                     |                        |          |              |
|   4.e store the     |<-- 4.d. Response ------|<----------              |
|       acess_token   |         with Access    |                         |
|       in the        |         token          |                         |
|       session       |                        |                         |
|                     |                        |                         |
|   4.d Send user     |                        |                         |
|       to profile    |                        |                         |
|       page          |                        |                         |
|                     |                        |                         |  
-----------------------                        ---------------------------
```


Let's create a `SessionsController`

```
rails g controller sessions
```

We can write something like the following to get started.


`sessions_controller.rb`


``` 
class SessionsController < ApplicationController 

  def oauth_connect
    # Use Instagram to redirect 
    #   user to instagram
    #   authentication page
  end


  def oauth_callback
    # Once user authenticates
    #  their access_token
    #  will be made available
    #  in the response to this
    #  method...

    # The access token 
    # is then put into the
    # session
  end

end

```

Which looks something like the following:

``` 
class SessionsController < ApplicationController 

  # Assuming you have the route in routes.rb
  # get "/oauth/callback", to: "sessions#callback"
  CALLBACK_URL = "http://localhost:3000/oauth/callback"

  # also on instagram's API management 
  #   you should configure your oauth
  #   callback to match the one above,
  #   at least while in development.

  Instagram.configure do |config|
    config.client_id = "YOUR_CLIENT_ID"
    config.client_secret = "YOUR_CLIENT_SECRET"
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

  def oauth_connect
    # Use Instagram to redirect 
    #   user to instagram
    #   authentication page
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end


  def oauth_callback
    # Once user authenticates
    #  their access_token
    #  will be made available
    #  in the response to this
    #  method...
    res = Instagram.get_access_token(params[:code], redirect_uri: CALLBACK_URL)
    # The access token 
    # is then put into the
    # session
    session[:access_token] = res.access_token
   
    # assuming you have a route
    # get "/profile", to: "users#profile", as: "profile"
    redirect_to profile_path
  end

end

```

#### Brief Aside

Note that the `Instagram.get_access_token(...)` call might seem weird, but if you look at the source it's just making a `POST` request with the code given back from `Instagram`.

```
    def get_access_token(code, options={})
      options[:grant_type] ||= "authorization_code"
      options[:redirect_uri] ||= self.redirect_uri
      params = access_token_params.merge(options)
      #
      #   See the POST request and the code
      #       |                          |----------------|
      #      \|/                                         \|/
      post("/oauth/access_token/", params.merge(:code => code), signature=false, raw=false, unformatted=true, no_response_wrapper=true)
    end

```



so for the above our `routes.rb` might have the following:


```
root to: "sites#index"
get "/oauth/connect", to: "sessions#oauth_connect"
get "/oauth/callback", to: "sessions#oauth_callback"
get "/profile", to: "users#profile"


```

Where a simple `users#profile` might look something  like the following:


```
class UsersController < ApplicationController

  def profile
    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user
    render "users/profile"
  end

end

``` 

with a simple view like the following

`app/views/users/profile.html.erb`


```
  <div>
    WELCOME <%= @user.name %>
  </div>
```

Note: we have a `sites#index` for the `root` route above.

```
class SitesController < ApplicationController
  
  def index
    render "sites/index"
  end

end

```

`app/views/sites/index.html.erb`

```
<%= link_to "LOGIN", oauth_connect_path %>

```





## Refactoring 


### Hiding Important Information

First things first we don't want to be publishing secret keys.

So we setup the `dotenv` gem to help us manage our environment variables.

`Gemfile`

```
group :test, :development do
  gem 'dotenv-rails'
end
```

Then after bundle installing this we need to create a `.env` file under our project directory

```
.
..
.git/
.gitignore
Gemfile
Gemfile.lock
README.md
Rakefile
app/
bin/
config/
config.ru
db/
.env <---- you should create .env file 
lib/
log/
public/
tmp/
vendor/
```

Let's drop in our variables into the `.env` file.

`.env`

```
CLIENT_ID='YOUR CLIENT ID'
CLIENT_SECRET='YOUR CLIENT SECRET'
```

Now we can refactor our `sessions_controller.rb`


```
class SessionsController < ApplicationController
  #...

  Instagram.configure do |config|
    config.client_id = ENV["CLIENT_ID"] # <--- NOTE THE CHANGE
    config.client_secret = ENV["CLIENT_SECRET"] # <---- NOTE THE CHANGE
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

  #...

end
```

Test your application by going to [your_site](localhost:3000) and clicking login. You should be `welcomed` by your profle.

Lastly, none of the `.env` file information should ever make its way to GitHub or be under version control, so we're going to ignore it.


`.gitignore`

```
# See https://help.github.com/articles/ignoring-files for more about ignoring files.
#
# If you find yourself ignoring temporary files generated by your text editor
# or operating system, you probably want to add a global ignore instead:
#   git config --global core.excludesfile '~/.gitignore_global'

# Ignore bundler config.
/.bundle

# Ignore all logfiles and tempfiles.
/log/*
!/log/.keep
/tmp

# Ingore the .env secrets
.env 
```

### Cleaning Up the Sessions Logic

Let's make a `SessionsHelper` to dry up some of our common procedures.


`SessionsHelper`

```
module SessionsHelper
  # Assuming you have the route in routes.rb
  # get "/oauth/callback", to: "sessions#callback"
  CALLBACK_URL = "http://localhost:3000/oauth/callback"

  # also on instagram's API management 
  #   you should configure your oauth
  #   callback to match the one above,
  #   at least while in development.

  Instagram.configure do |config|
    config.client_id = ENV["CLIENT_ID"] # <--- NOTE THE CHANGE
    config.client_secret = ENV["CLIENT_SECRET"] #<---- NOTE THE CHANGE
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

    
  def instagram_authorize()
     redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def login(code)
      # Once user authenticates
    #  their access_token
    #  will be made available
    #  in the response to this
    #  method...
    res = Instagram.get_access_token(code, redirect_uri: CALLBACK_URL)
    # The access token 
    # is then put into the
    # session
    session[:access_token] = res.access_token
  end

  def logout
    session[:access_token] = nil
  end

  def logged_in?
    if session[:access_token].nil?
      redirect_to oauth_connect_path
    end
  end

  def current_user
    @client ||= Instagram.client(:access_token => session[:access_token])
    @client.user
  end
end
```


Then we include this in our `ApplicationController`.



```
class ApplicationController < ActionController::Base

  #...

  include SessionsHelper
end

```

Now we can refactor our `SessionsController`


```
class SessionsController < ApplicationController 

  def oauth_connect
    instagram_authorize()
  end


  def oauth_callback
    login(params[:code])
    redirect_to profile_path
  end

end

```

And we can also refactor our `UsersController`.


```
class UsersController < ApplicationController

  def profile
    @user = current_user
    render "users/profile"
  end

end


```

We can also add a before_action check to make sure a `user` is `logged_in`.


```
class UsersController < ApplicationController
  before_filter :logged_in?, only: [:profile]

  def profile
    @user = current_user
    render "users/profile"
  end

end

```