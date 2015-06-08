# Rails Fundamentals
## Intro SQL

| Objectives |
| :---- |
| Discuss SQL database structure and components |
| Discuss and create tables, columns, types, and constraints in Postgres |
| Discuss and implement simple queries for resources in Postgres |

## Setup

* Go and download [Postgres.app](http://postgresapp.com/)
* Finish install and drag it into your applications folder.
* Then add Postgres.app to your `$PATH`

  ```bash
    echo 'PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin' >> ~/.bash_profile
  ```
* Then source your `~/.bash_profile`
  
  ```bash
  source ~/.bash_profile
  ```
* Check that your install worked

  ```bash
  which psql
  ```

## Outline 

* What is SQL?
  * tables, rows, and columns
* ORDBMS and RDBMS
  * Postgres, MySQL, SQLite, Microsoft SQL Server
* Data Definition Language
  * `CREATE`, `ALTER`, `RENAME`, `DROP`, `TRUNCATE`
  * Data Types
  * Constraints
* Queries
  * `SELECT`, `INSERT`, `UPDATE`, `DELETE`    * `MERGE` or `UPSERT` coming to **Postgres** 9.5
* DUMP-ing


## What Is SQL?

Relational databases structure data so that it can be queried by a relational algebra. The idea of relational model was to use collections of data, **Tables**, where each database manages **Relations** or collections of Tables. *Tables are collections of **Rows** or  with attributes or **Columns***.

#### Authors Table

| `id` | `first_name` | `last_name` | `y_o_b` | `y_o_d` |
| :---  | :---  | :---  | :---  | :---  |
| 1 | Rudyard | Kipling | 1865 | 1936 |
| 2 | Lewis | Carroll | 1832 | 1892 |
| 3 | H.G.  | Wells |  1866 | 1946  |



#### Books Table

| `id` | `title` | `description` | `publication_year` | `isbn` | `author_id` |
| :---  | :---  | :---  | :---  | :---  | :---  |
|1 | The Jungle Book | The Jungle Book is a collection of stories by English author Rudyard Kipling. The stories were first published in magazines in 1893–94. The original publications contain illustrations, some by Rudyard's father, John Lockwood Kipling. | 1894 | 9788497896696 | 1 |
| 2 | Alice's Adventures in Wonderland | Alice's Adventures in Wonderland is an 1865 novel written by English author Charles Lutwidge Dodgson under the pseudonym Lewis Carroll. | 1865 | 9781552465707 | 2 |
| 3 | Rikki-Tikki-Tavi |"Rikki-Tikki-Tavi" is a short story in The Jungle Book by Rudyard Kipling about the adventures of a valiant young mongoose. The story has often been anthologized, and has been published more than once as a short book in its own right. | 1894 | 1484123689 | 1 |
| 4 | Through the Looking-Glass | Through the Looking-Glass, and What Alice Found There is a novel by Lewis Carroll, the sequel to Alice's Adventures in Wonderland. It is based on his meeting with another Alice, Alice Raikes | 1871 | 9781489500182 | 2 |
| 5 | The Time Machine | The Time Machine is a science fiction novel by H. G. Wells, published in 1895. Wells is generally credited with the popularisation of the concept of time travel by using a vehicle that allows an operator to travel purposefully and selectively | 1895  | 9781423794417 | 3 |



## ORDBMS and RDBMS

[Services](http://en.wikipedia.org/wiki/List_of_relational_database_management_systems#List_of_Software)


## Data Definition Language

The **DDL** is the language we use to create and manage **Relations** in our database.

* Let's first create our first database

```bash
createdb practice
```

  * Then let's connect to it so we can practice more SQL

  ```bash
  psql practice
  ```

  * You should see a prompt like the following:

  ```sql
  practice=# 
  ```

* Now let's try to create our first Table

  ```sql
  CREATE TABLE author (
    id SERIAL primary key,
    firstName VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT now()
  );
  ```

  * [`SERIAL TYPE`](http://www.postgresql.org/docs/9.4/interactive/datatype-numeric.html#DATATYPE-SERIAL)
  * [`Primary Key`](http://www.postgresql.org/docs/9.4/interactive/ddl-constraints.html#DDL-CONSTRAINTS-PRIMARY-KEYS)
  * [MORE DATA TYPES](http://www.postgresql.org/docs/9.4/interactive/datatype.html)


* Let's learn how to `ALTER` this table after is created.

  ```sql
  ALTER TABLE author ADD COLUMN last_name varchar(255);
  ```
* Now an author doesn't need a `description` column so let's remove it.

  ```sql
  ALTER TABLE author DROP COLUMN description;
  ```
* Oops, **Table** names should always be plural.

  ```sql
  ALTER TABLE author RENAME TO authors;
  ```
* Oops, it looks like our `firstName` column is `camelCased` all column names should be `snake_case`.

  ```sql
  ALTER TABLE authors RENAME COLUMN firstName TO first_name;
  ```

* This was a great table and you should try doing all this again sometime, so let's `DROP` our table.

  ```sql
  DROP TABLE authors;
  ```

## Querying

Let's begin by creating a `products` table

```sql
CREATE TABLE products (
  id serial primary key,
  name text,
  price numeric NOT NULL DEFAULT 'NaN',
  quantity integer NOT NULL DEFAULT 0
);
```

How do we get data into the table. Let's try an example using `INSERT`.

```sql
INSERT INTO products
  (name, price, quantity)
  VALUES
  ('blue jeans', 50.00, 20);
```

Let's add a few more items to our products

```sql
'blue slacks', 62.00, 15
'plain T-Shirts', 10.00, 75 
'long shorts', 25.00, 10
```

That seems great, but how do we see all this data?

```sql
SELECT * FROM products;
```

How would we view only the names of products?

```sql
SELECT name FROM products;
```

How would we view them all sorted by price?

```sql
SELECT name FROM products ORDER BY price;
```

How would would we grab just `plain T-Shirts`

```sql
SELECT * FROM products
  WHERE name = 'plain T-Shirts';
```

This is the first time we have seen the `WHERE` clause, and it's nifty.


```sql
SELECT * FROM products
  WHERE price > 18.00
  ORDER BY price;
```

So far we've had a great time trying to `SELECT` data from our TABLE.

```sql
UPDATE products
  SET quantity = quantity - 1
  WHERE name = 'long shorts';
```

We can also change `plain T-Shirts` to `plain T-shirts`


```sql
UPDATE products
  SET name = 'plain T-shirts'
  WHERE name = 'plain T-Shirts';
```

You might wondering why you don't see anything change after you update an entry. This is not standard behavior, but you can tell postgres to return the modified record.

```sql
UPDATE products
  SET quantity = quantity - 1
  WHERE name = 'long shorts'
  RETURNING *;
```

Let's remove some of these rows in our `products` table.

```sql
DELETE FROM products
  WHERE name = 'long shorts'
  RETURNING *;
```

You can also `DELETE` a everything but the `blue slacks`


```sql
DELETE FROM products
  WHERE name <> 'blue slacks';
```

You can `DELETE` everything from a table using

```sql
DELETE FROM products;
```

### Exercises

* Re-insert into  the table the four items we started with.


## ALIAS

You can make your queries seem more readable and comprehendable using an alias.


```sql
SELECT * FROM products
  AS prod
  WHERE prod.name = 'long shorts';
```

## DISTINCT

We can also filter out rows that aren't distinct when we do our selection.


```sql
INSERT INTO products
  (name, price, quantity)
  VALUES
  ('blue jeans', 50.00, 20);
```

Try to remove duplicates from selection

```sql
SELECT DISTINCT ON (name) *
  FROM products;
```

## Research

* Aggragate
* GROUP BY






























































