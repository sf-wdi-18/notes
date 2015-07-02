#CORS

##Goal

* Conceptualize how to enable a 3rd party application to consume a Rails app as an API

##Intro

Rails is a great framework to build out a RESTful API. Angular is a great framework that can CRUD a RESTful API and template the data onto a single View. This setup allows a web application to feel just like a native one.

##RESTful Rails API

In order for you to setup a Rails app to act as a RESTful API there are a few things to consider.

* Rails 5 will have this feature built in with the command

`rails new --api <api name>`

For now we have to do it manually.

###Enable CORS

* Create a new Rails project
* Add `gem 'rack-cors', :require => 'rack/cors'`
* In `config/application` configure `rack-cors` to accept requests from any origin. It belongs anywhere inside the `Application` class.

```
config.middleware.insert_before 0, "Rack::Cors" do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options]
  end
end
```
* Depending on if you are building an internal or externally facing API, you can specify the origin to accept request only from a specific domain. `*` denotes that it will accept requests from anywhere.

###Disable CSRF for Specific Controllers

**Warning** This expose part of your API to anyone, which can cause potentially unexpected behavior.

If you want to allow a controller to be reachable by a 3rd party you can tell it to ignore an authenticity token by skipping a registered `before_action`.


```ruby
class SomeController < Application Controller
	skip_before_action :verify_authenticity_token
	
	def index
	 ...
	end
	
end
```

If you wanted a 3rd party to not be able to write data to your API you can say

`skip_before_action :verify_authenticity_token, except: [:create, :update, :delete]`



###API Keys/Tokens

Given we are exposing our API to anyone we should create a user that has to first register on our site to be issued an API key. You can read more on that [here](https://github.com/sf-wdi-18/notes/blob/master/lectures%2Fweek-10%2Fday-02%2Fdawn-api%2FREADME.md#part-1-token-authentication).

Once our users are issued an API key we'd want to register a before action that checks for it every time a request is made. The API key will typically be sent as a query parameter and is accessible to us in the `params` object. We can now use this key to infer which user is making the request.

* The API keys should be unique to each user
* The API should render a 404 response if the key is not present or does not exist in our database

This is now our new layer of security for an open API, rather than Rails typical method of setting a CSRF token in the headers of the request/response cycle.
