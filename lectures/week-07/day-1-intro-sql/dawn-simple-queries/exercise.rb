require 'pg'

conn = PG.connect(dbname: "shopper_app")

conn.exec("CREATE TABLE shopper (
              id serial primary key,
              first_name varchar(255),
              last_name varchar(255),
              email text,
              address text)")
