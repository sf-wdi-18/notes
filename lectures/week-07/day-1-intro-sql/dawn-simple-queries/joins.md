# Rails Fundamentals
## JOINS

| Objectives |
|:---|
| To discuss and explain different types of table relations in SQL |
| To discuss and implement ways to query using relationships from two tables |
| To explain relationship concepts like `foriegn_key` and `join_table` using simple ERD |


## Why Are Joins Important

Each table in a relational database is consider a relation wherein all the data is naturally related by single set of attributes defined for it. However, in order to be relational we need to be able to make queries between relations or tables of data.

JOINS are our means of implementing queries that join together data and show results from multiple tables.


## Keys

* Primary Key: The primary key of a relational table uniquely identifies each record in the table. This column is automatically assigned a btree index in postgres.

* Foreign Key: a foreign key is a field (or collection of fields) in one table that uniquely identifies a row of another table.[1][2][3] **In other words, a foreign key is a column or a combination of columns that is used to establish and enforce a link between the data in two tables.**

![primary_foreign_key.png](images/primary_foreign_key.png)


## Example

Let's use a simple foreign key relationship as follows between `people` and `petss` tables.


```sql
create table people (
  id serial primary key,
  name text,
  age integer
);

create table pets (
  id serial primary key,
  name text,
  age integer,
  breed text,
  people_id integer
);

INSERT INTO people ( name, age)
      VALUES ('Zed', 37);

INSERT INTO people ( name, age)
    VALUES ('Bobby', 7);

INSERT INTO pets (name, breed, age, people_id)
      VALUES ( 'Fluffy', 'Unicorn', 1000, 1);

INSERT INTO pets (name, breed, age, people_id)
      VALUES ('Rocko', 'Dog', 4, 2);

INSERT INTO pets (name, breed, age, people_id)
     VALUES ('Gigantor', 'Robot', 25, 1);

INSERT INTO pets (name, breed, age, people_id)
     VALUES ('Goldy', 'Fish', 1, 2);
```


Let's try our first joins

```sql
  SELECT * FROM people
  INNER JOIN pets
  ON people.id = pets.people_id;

  SELECT people.name, pets.name from people
  INNER JOIN pets 
  ON people.id = pets.people_id;

```

**Other Types of Joins**  


Full Outer Join  

```sql
SELECT * FROM people 
  FULL OUTER JOIN pets
  ON people.id = pets.people_id;
```

Left Outer Join  

```sql

SELECT * FROM people 
  LEFT OUTER JOIN pets
  ON people.id = pets.people_id;

```

Right Outer Join  

```sql

SELECT * FROM people 
  RIGHT OUTER JOIN pets
  ON people.id = pets.people_id;

```  

Left Outer Join with Where  

```sql
SELECT * FROM people
  LEFT OUTER JOIN pets
  ON people.id = pets.people_id
  WHERE pets.breed = 'Unicorn';
```

Cross Join  

```sql
SELECT * FROM people
  CROSS JOIN pets
  WHERE people.id = 1;
```
