#Auth in Rails

##Learning Objectives

By the end of this lesson...

* Implement an authentication system in Rails that securely stores users' passwords
* Design the User model specs using TDD 
* Build the routes, controllers, and views necessary for a user to have the necessary interface to signup & login

## App Setup

Let's start a new Rails application:

* `rails new rails_auth_app -T -B -d postgresql`   # Why -T and -B?
* `cd rails_auth`
* `bundle`
* `rake db:create`
* `subl .`

## Model Setup

CLARIFY: When do we ever worry about controllers before we've generated models?
Let's leave our controllers be for the time being and setup our models.  

NOTE: string is the default type.  Don't have to specify
```
rails g model user email:string password_digest:string   
```

`email` is the natural username for our user, and the `password_digest` is a fancy term for a hashed password.


```
rake db:migrate
```

## Authentication Review

**Authentication** is the process of verifying a user's credentials to prove they are who they say they are. This is different than **authorization**, enabling or disabling access to specific resources.

To authenticate our users we typically ask them for a **password** we can associate to their `email`. A password is a very private piece of information that must be kept secret, and so, we strategically obscure in such a way that *one can only confirm a user is authentic and never uncover what their actual password*.

Our library of choice for password obfuscation is called `BCrypt`. This will be added to our gemfile for authentication setup later. In Rails, the convention is to push more logic into our models, so it shouldn't come as a surprise that authentication setup will happen in the **user model.**

Let's uncomment the `bcrypt` at the bottom of our `Gemfile`.

`Gemfile`

```ruby
	# Use ActiveModel has_secure_password
	gem 'bcrypt', '~> 3.1.7'
```

Then run `bundle` to finish installation of `bcrypt`.

### Playing With `BCrypt`

As soon as something is installed via bundler we can access it via our `rails console.` Let's play in console.


```bash
	Loading development environment (Rails 4.1.6)
 ## Let's create our first password & save the hashed output to a variable
	2.1.0 :001 > hashed_pass = BCrypt::Password.create("foobar")
	 => "$2a$10$6MQQCxBpfu16koDVs3zkbeSXn1z4fqKx9xLp4.UOBQBDkgFaukWM2"

 ## Let's compare our password to another
 	2.1.0 :003 > BCrypt::Password.new(hashed_pass) == "blah"
 	=> false
 	
 ## Let's compare our password to original
 	2.1.0 :004 > BCrypt::Password.new(hashed_pass) == "foobar"
 	=> true
 	
 ## Exit
 	2.1.0 :005 > exit
```


Hopefully this helps you begin to think about how to setup an **authenticate** method for the `User`.


## Test Setup

* Run the command `rails g spec:install` to initialize rspec as your testing suite.
	* Now a `spec` directory has been created for you
* Inside `spec` create the file `/models/user_spec.rb`, place in the below tests, & run the command `rspec`

```ruby
require 'rails_helper'

describe User, type: :model do

  context 'Validation' do
    let(:user) do
      #create a user in active memory
      User.new({
        email: "bana@na.com",
        password: "adsf1234",
        password_confirmation: "adsf1234"
      })
    end
    it "validates presence of password_digest" do
      #clear values of password & password_confirmation
      user.password_digest = nil
      expect(user).not_to be_valid
    end

    it "validates presence of email" do
      #clear values of email
      user.email = nil
      expect(user).not_to be_valid
    end

    it "validates password & password confirmation match" do
      user.password_confirmation = "not the same"
      expect(user).not_to be_valid
    end
  end

  context 'Initialization' do
    let(:user) { User.new }

    it "allows the setting of a password" do
      expect(user).to respond_to(:password=).with(1).argument
    end

    it "allows the getting of a password" do
      expect(user).to respond_to(:password)
    end

    it "creates a password digest when a password has been set" do
      #password digest starts as nil
      expect(user.password_digest).to be_nil
      #password is set
      user.password = "swordfish"
      #password digest is created after passsword is set
      expect(user.password_digest).not_to be_nil
    end
    it "ensures the password digest is not the password" do
      user.password = "swordfish"
      expect(user.password_digest).not_to eq(user.password)
    end
  end

  context 'Authentication' do
    before(:all) do
      #save a user to the database
      @user = User.create({
        email: "shmee@me.com",
        password: "jumanji",
        password_confirmation: "jumanji"
      })
    end
    it "restricts passwords from saving to the db" do
      found_user = User.all.first
      expect(found_user.password).to eq(nil)
    end

    describe "#authenticate" do
      it "returns the user when the correct password is provided" do
        expect(@user.authenticate("jumanji")).to eq(@user)
      end

      it "returns false when an incorrect password is provided" do
        expect(@user.authenticate("ijnamuj")).to eq(false)
      end
    end

    describe "::confirm" do
      it "checks if a specified user & password combination exists" do
        user_email = "shmee@me.com"
        user_password = "jumanji"
        found_user = User.find_by_email(user_email)
        expect(User.confirm(user_email, user_password)).to eq(found_user.authenticate(user_password))
      end
    end
  end
end
```

## TDD Authentication

Let's pass the tests to build our authentication system!

```ruby
class User < ActiveRecord::Base
  BCrypt::Engine.cost = 12

  validates_presence_of :email, :password_digest
  validates_confirmation_of :password

  def authenticate(unencrypted_password)
    secure_password = BCrypt::Password.new(self.password_digest)
    if secure_password == unencrypted_password
      self
    else
      false
    end
  end

  def password=(unencrypted_password)
    #raise scope of password to instance
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def password
    #get password, equivalent to `attr_reader :password`
    @password
  end

  def self.confirm(email_param, password_param)
    user = User.find_by({email: email_param})
    user.authenticate(password_param)
  end


end
```


## Routes, Controllers, & Views for Signup

###The Happy Path...

* **Step 1**
GET to `/signup` hits the `user#new` action and renders `/views/users/new.html.erb`.

* **Step 2**
A signup form_for POSTs to `user#create` with form data.

* **Step 3**
`user#create` creates a new users, logs them in, and redirects to `user#show`.

* **Step 4**
`user#show` renders `/views/users/show.html.erb`, the user's profile page.


## Routes

Let's edit our `config/routes.rb` file...


```ruby
Rails.application.routes.draw do

  root to: "welcome#index"

  get "/login", to: "sessions#new"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  resources :users

end
```

Run `rake routes` to see all your routes.

## Home Page

**Challenge:** Start your application and start debugging errors until the view rendered on the `root_path` has:

* A welcome message
* A button to signup

## Controllers

* Skeleton out the `UsersController` with: `rail g controller users new create show`

* Add a private method that creates strong parameters by whitelisting specific attributes of the user

* You should end up with...

```ruby
class UsersController < ApplicationController
  
  def new
  end

  def create
  end

  def show
  end

  private
    def user_params
      	params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
```

##Challenge: Implement the Signup [Happy Path](#the-happy-path)

####Step 1

* For your `/sign_up` route, which hits the action `user#new`, render a file `new.html.erb` in `/views/users`

####Step 2

* In that view add a `form_for` referencing user; have it post to `users#create` with `email`, `password` and `password_confirmation`

####Step 3

* In `users#create` create a user and then login them in by creating a [new session](#session_creation) then redirect to `user#show`
	* Bonus: create a condition that checks if the user was saved correctly. Hint: first build the user in memory with `.new` then check `if @user.save` proceed as normal `else` render the signup page again. You can [add flash messages](#flash_msgs) later.

####Step 4

* `user#show` will find the [current user](#current_user) and display their profile page

##Fin

You may reference this [example](https://github.com/sf-wdi-18/barebones_rails_auth) for what barebones rails app with authorization would look like.

##Useful Notes

<h3 id="session_creation">Login a user</h3>

Since creating a session is essentially what we mean when want to login, and logging out is destroying a session. We have a single controller dedicated to session managment, `SessionsController`.

`app/controllers/sessions_controller.rb`

```ruby
class SessionsController < ApplicationController
  def new
    #TODO: render a login view
  end

  def create
    #pass in array that user_params returns as arguments using a splat
    user = User.confirm(params[:email], params[:password])
    if user
      #this creates the session, logging in the user
      session[:user_id] = user.id
      #redirect to the show page
      redirect_to user_path(user.id)
    else
      #there was an error logging the user in
      redirect_to login_path
    end
  end
  
  def destroy
    #TODO: logout the current user
  end
  
end

```
After we authenticate someone we set `session[:user_id] = user.id`. This allows the `user.id` to be stored in a cookie for lookup later. Of course, then we have to go find they the user in our DB every time using the `user_id` in the session. With all of this in mind we separate out a lot of the logic related to `sessions` into a list of very helpful methods in `SessionsHelper`.

Note: Reference the [logout](#logout) note below if you're curious how to implement that.

<h3 id="current_user">`current_user` Method</h3>

When logging in a user, we set `session[:user_id] = user.id`. What if we could take advantage of this fact for quicker lookup? Instead of reading the user_id from the session and then finding the correct user in the database -- every time we need the user -- what if we only did it once, and cached the result? In other words, what if we cached the `current_user`?

```ruby
class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end
  helper_method :current_user #make it available in views
end
```

Defines @current_user if it is not already defined.

`current_user` is very useful for:

* Conditional views based on the `current_user`'s state
	* I.e. is a login or logout button displayed in the nav_bar?
* Authorization to view resources
	* I.e. test if `current_user` is the user who's resources are being CRUDed.

<h3 id="logout">Logout</h3>

In the `session#destroy` controller action set the `session[:user_id]` to `nil` and redirect to your `root_path`

## Bonus

###Refactor

* Using [`has_secure_password`](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password) can magically refactor a lot of our password storing logic in the User model. Try it out and see if the tests still pass...

![success!](http://i.giphy.com/b6oC7bEdJD26c.gif)

<h3 id="flash_msgs">Bonus: Add Flash Messages</h3>

If someone fails to login we want to notify them, because the situation is much different than if they tried to go to `localhost:3000/users/1` and weren't logged in. The flash storage is a type of session storage that is stored between requests and then cleared each time.


```ruby
class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:user)
    user = User.confirm(user_params[:email], user_params[:password])
    if user
      # use our handy login method
      login(user)
      redirect_to user_path(user.id)
    else
       # Flash an error message
      flash[:error] = "Failed To Authenticate. Please try again."
      redirect_to "/login"
    end

  end
end
```


We can then render these errors in our `sessions/new.html.erb` and style them with a class that matches their name.

```html+erb
<%= form_for :user, url: "/sessions", method: "post" do |f| %>
    <% flash.each do |name, msg| %>
      <%= content_tag :div, msg, class: name %>
    <% end %>
  <div>
    <%= f.text_field :email %>
  </div>
  <div>
    <%= f.text_field :password %>
  </div>
  <div>
    <%= f.submit %>
  </div>
<% end %>

```

An [example](https://gist.github.com/suryart/7418454) of how to render flash messages with the help of bootstrap's classes.
