# Week 10 Weekend Lab
## API's and Angular

The objective of this assignment is to finish the design of an API that uses basic http sign up and creates a unique token that can be used to confirm a user's interactions with the API.

## Brief

You'll need to reference the point of sale application you developed during the week. You should finish this if you haven't already. If you need help, see the `setup_help.md` file included in this repository. Once you have a simple receipts API, where a user can sign up and login with an email and password, then you should focus on the angular application for the `/account` page. This page should contain an angular application that satisfies the following.

###User stories

User can...

* View a reset button for their api token without page reload -- "simple"
* Click a button to view all their `simple_receipts` without page reload -- "simple".
* See a form that allows them to add a `simple_receipt` without page reload -- "medium".
* See the new `simple_receipt` added to the page.
* See how many receipts were created today -- "easy/medium depending on approach".
* Delete a receipt without page reload -- "medium".
* Click a receipt and see a model to edit and update  it without changing views -- "medium/difficult".
* See a dashboard of their profile information. User can edit profile details without page reload via modal -- "medium/difficult".
* See how see a total from all receipts for the day -- "easy/medium/hard depending on your approach".

(complete these in whatever order you wish)

## Note

You can build the `/account` application with jQuery if you don't feel comfortable with angular, but this is in some ways more difficult; however, it's a great exercise if won't use angular in the final project.

## Getting Started: Angular and Rails


Let's install Angular with Rails. Let's use Bower to manage our vendor assets.

```
npm install -g bower
```

Once you have Bower you can get started. However, we don't want our bower_components in any folder. Let's make sure they end up `vendor/assets/`. We can do this with a bower config file.



```bash
touch .bowerrc

```

And in the `.bowerrc` add...


```javascript
{
	"directory": "vendor/assets/components"
}

```

Then we can install angular via bower.


```
bower install --save angular
```

Then verify that in your `vendor/assets/components/` their is an `angular` folder. Once you verify that you application has angular you can then move on to requiring it in your assets.

`app/assets/javascripts/application.js`

```javascript
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require angular/angular 
//= require_tree .

```

Do you see angular in the above list of requires. It's important that it comes before `//= require_tree .`


Now you can write all you angular application code in your application.js. Let's add some simple logic to our application.js.

Note: writing code without annotating your dependencies as strings will work in Rails development. In production Rails tries to minify your assets, so things will start breaking. If you hate annotating your code to be minification safe checkout this sweet [lib](https://github.com/olov/ng-annotate).

`application.js`

```javascript
...

var AccountApp = angular.module("AccountApp", [])

AccountApp.controller("MainCtrl", function ($scope) {
	$scope.greeting = "Hello world";
});

```

Then in your `show.html.erb` for your `/account` route. let's add the following.

```html

<div ng-app="AccountApp">
	<div ng-controller="MainCtrl">
		{{greeting}}
	</div>
</div>

```

Then if you login and go to your account at [localhost:3000/account](localhost:3000/account).

You should see 

```
Hello world
```


## Displaying User Data

You can get information about the user using angular's built-in `$http` module.


`application.js`

```
var AccountApp = angular.module("AccountApp", [])

AccountApp.controller("MainCtrl", function ($scope, $http) {
	$scope.greeting = "Hello world";
	
	$scope.current_user = null;
	
	$http.get("/account.json").
		success(function (data) {
			$scope.current_user = data;
		});
});

```



This assumes you have the following route


```ruby

get "/account", to: "store_owners#show"
```

with a `show` method that looks something like th following.



```ruby

def show
  @store_owner = current_owner
  
  respond_to do |f|
  	f.html
  	f.json {render json: @store_owner }
  end
end

```

This just glorified version of the `users#show` that we've worked with the whole class.


You can then display the user information on the in the `show.html.erb`.


```html
<div ng-app="AccountApp">
	<div ng-controller="MainCtrl">
		{{greeting}}
		{{current_user}}
	</div>
</div>

```

## Pitfalls: 422 Unprocessible

If you're going to be posting and patching to the rails server you'll need a csrf param. Angular has to be congifured to send this with a request.

`application.js`

```javascript

var AccountApp = angular.module("AccountApp", [])

// just add this!! 
AccountApp.config(["$httpProvider", function ($httpProvider) {
	$httpProvider.
		defaults.headers.common["X-CSRF"] = $("meta[name=csrf-token]").attr("content");
}])

AccountApp.controller("MainCtrl", function ($scope, $http) {
	$scope.greeting = "Hello world";
	
	$scope.current_user = null;
	
	$http.get("/account.json").
		success(function (data) {
			$scope.current_user = data;
		});
});

```
