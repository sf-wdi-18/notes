# Intro REST API's
## Auth Services

Welcome to the independence arc of the course. These materials on **REST API**'s are designed to engage your full understanding of many topics, e.g.

* `Routing`
* `HTTP`
* `REpresentational State Transfer`
* `MVC`
* `Authentication`
* `Authorization`
* `Error Handling`

The language chosen for the implementation of these exercises will be considered optional, **Rails is prefered**. Your amount of progress will largely be determined by your research and resourcefulness. You should also seek out more peer feedback.

## Outline

* Part 1
  * Sign Up/Login
  * Token Creation
  * Resource creation for receipts
* Part 2
  * Password Reset
  * Mailers


## PART 1: Token Authentication

In this example we are going to create a service to allow us to sign up for an `api-key`. It will have a minimal FE service to allow you to sign up and generate a token.

### Round  1

* Core Routes
  * `root`: a splash page for `Store It`.
  * `/signup`: a sign up form with a store's `Name`, `Email`, `Password` and `Password Verf.`
  * `/account`: display account information for the `Store` 
  * `/login`: allowing a store to login and see account information.

### Model Suggestions

* Your typical `user` model will be a `Store` that is capable of storing the above information and other details you might imagine about a store.
* Your `ApiToken` will be a separate model associated to the store.
  * An `ApiToken` should have a `hex_value` column that is a `unique` and SecureRandom key.

### Round 2
 
A `receipts` resource! We will need a model to store arbitrary receipt information provided by a store.

* Core Routes
  * `GET /receipts` returns all receipts for an authorized store.
  * `POST /receipts` creates a receipts for an authorized store.


At this stage it is your responsiblity to decide how users should send in an `api-token` with their request. It also up to you to decide how to verify the `token` and find the user with each request.

### Simple Receipts

This is an optional endpoint for quick demonstration. If you feel confident with modeling you can move on to full receipts.

* `transaction_number: string`
* `payment_method:string`
* `amount: decimal`
* `tip: decimal`
* `total: decimal`

```
{ 
  "receipt": {
  "transaction_number": "XXXXXXXX",
  "payment_method": "VISA ENDING IN 4242",
  "amount": "12.19",
  "tip": "2.40",
  "total": "14.49"
  }
}

```

If you put the above json in a `simple_test.json` file you can try the following for debuggin'

```
curl -H "Content-Type: application/json" --data @simple_test.json localhost:3000/simple_receipts.json?api_token=8a7edac1-7e37-47fd-a39e-2b70d13a647a > response.html && open response.html
```

Should be able to `GET` and `POST` to `/simple_receipts`.

### Full Receipts

The `Receipt` model should have an associated `Store`. It should have some of the following attributes

* `customer_info: json`
* `items: json`
* `subtotal: decimal`
* `taxes: decimal`
* `total: decimal`
* `transaction_number: string`
* `item_count: integer`
* `payment_method: string`
* `tender_amount: decimcal`
* `tip: decimal`
* `change_due: decimal`



For simplicity you can assume a `Store` will only create receipts with this information already provided. You might expect a Store to post data like the following to the `/receipts` 


**NOTE** Single qoutes aren't valid json

```
{
  'customer_info': {
                    'first_name': 'Jane',
                    'last_name': 'Doe',
                    'member_id': 'xxxx'
                  },
  'items': [
              {
                'sku': 'ABC123',
                'description': 'Super Computer',
                'upc': '012345678901',
                'serial_number': '123ABC123',
                'price': '1000.00',
                'taxcode': 'A'
              },
              {
                'sku': 'CDE456',
                'description': 't-shirt',
                'upc': '222333222333',
                'price': '12.00',
                'qty': '4',
                'taxcode': 'A'
              },
              {
                'plu': '4135'
                'description': 'Gala Apples',
                'weight': '4.1 lb',
                'rate': '1.00 / 1 lb',
                'price': '4.10',
                'taxcode': 'B'
              },
              {
                'description': 'soda can',
                'price': '1.00',
                'taxcode': 'A'
              }
           ],
  'subtotal': '1017.10',
  'taxes': '81.04',
  'total': '1098.14',
  'payment_method': 'CARD ENDING in XXXX',
  'tender_amount': '1098.14',
  'change_due': '0.00',
  'transaction_number': 'XXXXX',
  'item_count': '7'
}

```

You can post JSON to you server using `curl` and putting the above in a body.json file in a directory of your choice.

```
curl -H "Content-Type: application/json" --data @body.json http://localhost:3000/receipts?api_key=testing123
```

## Part 2: Reset Logic

It is very important to attempt to design a password reset scheme you can use to help users who have forgotten their passwords. If you haven't done this before you should attempt it.


### BASIC RESET

* user clicks password reset and is redirect to form
  * user enters both `email` and `username` for the account.
  * user receives an email with a unique link to the password reset link for the account. Link contains a long SecureRandom and unique param
    * user should not see any personal information in the email
  * user clicks link to reset password, no information or username should be displayed.
  * user submits new password and is prompted to login with `username` and new password.

### Stronger Reset Stories

Assuming all of the above stories plus the following

* user account is `locked` after 5 or so failed attempts.
* user must select 2 strong security questions before sign up is complete.
* user must answer at least one security question on link to reset password 


### User Emailing Hints

* Use action mailer to generate a mailer, [action mailer](http://guides.rubyonrails.org/action_mailer_basics.html) for sending an email.
* Sign up for a `mailgun` account. You should be given a "sandbox account." You can find this under [https://mailgun.com/app/domains](https://mailgun.com/app/domains).
* Configure your app in `config/environments/development.rb`.

```
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    :authentication => :plain,
    :address => "smtp.mailgun.org",
    :port => 587,
    :domain => "smtp.mailgun.org",
    :user_name => "postmaster@sandboxXXXXXXXXXXXXX.mailgun.org",
    :password => "XXXXXXXXXXXXXX"
  }


```

Also be sure to set a default host.
## Security Notice

The above example assumes you're developing locally, but as a best practice you want to hide your secrets using `dot-env` or equivalent software.

