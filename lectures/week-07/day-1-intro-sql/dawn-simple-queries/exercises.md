# Intro SQL
## Exercises With PG

So far you've been interacting directly with your database using `psql`. However, we want to gain understanding to how Ruby libraries can manipulate and model SQL interactions at the application level. Thus we will continue exploring SQL using the `pg` gem.

```bash
gem install pg
```

Then create a `shopper_app` using the `createdb` command from earlier.

## Exercise 1: Simple Connection

Try the following, copy it into an `example_1.rb`

```ruby
require 'pg'

conn = PG.connect(dbname: "shopper_app")

conn.exec("CREATE TABLE shopper (
              id serial primary key,
              first_name varchar(255),
              last_name varchar(255),
              email text,
              address text)")

```

* Run the file.
* Run `psql shopper_app` and verify the table exists

```
select * from shopper;
```

* What happens when you try to run the second time?

## Exercise 2: Alter Table

What's wrong with above table name? Let's alter it to be correct. Copy the code from the above exercise into a new file `example_2.rb` and erase the exec query and write a query to `ALTER` and `RENAME` the table to `shoppers`.

## Exercise 3: Inserting

Create file called `example_3.rb` and use `pg` to insert three new people into the `shoppers` table.

Try doing it the way we did in class and then try it using the following format.

```ruby
conn.exec("INSERT INTO shoppers
            (first_name, last_name, email, address)
            VALUES
            ($1, $2, $3, $4)",
            ["zoe", "doe", "zoe@gmail.com", "1234 st"]);

```

The `($1, $2, $3, $4)` in the insertion represents the first, second, third, and fourth items in the array passed to `exec`.

Use `psql` to verify they exist.

## Exercise 4: Fake Data

Writing a bunch of fake data is tedious and time consuming. Let's use a gem to help use create fake data.

```ruby
gem install ffaker
```

Then let's try using it in the REPL before we go writing code with it.

```
> require "ffaker"
> FFaker::Name.first_name
# => 'Zoe'
> FFaker::Name.last_name
# => 'Doe'
> FFaker::Internet.email
# => 'ethyl@roberts.us'
```

## Exercise 5: Fake Create

Use the `ffaker` gem to insert three new entries into the db.

































