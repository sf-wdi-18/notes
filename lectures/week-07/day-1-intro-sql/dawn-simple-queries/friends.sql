DROP DATABASE IF EXISTS friends_example;
CREATE DATABASE friends_example;

\c friends_example

CREATE TABLE biking_friends (
  id SERIAL PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE running_friends (
  id SERIAL PRIMARY KEY,
  name varchar(255)
);

INSERT INTO biking_friends (name) VALUES ('john doe');
INSERT INTO biking_friends (name) VALUES ('jane doe');
INSERT INTO biking_friends (name) VALUES ('jack doe');
INSERT INTO biking_friends (name) VALUES ('jay doe');
INSERT INTO biking_friends (name) VALUES ('jen doe');
INSERT INTO biking_friends (name) VALUES ('jesse doe');


INSERT INTO running_friends (name) VALUES ('max doe');
INSERT INTO running_friends (name) VALUES ('jen doe');
INSERT INTO running_friends (name) VALUES ('john doe');
INSERT INTO running_friends (name) VALUES ('jane doe');
INSERT INTO running_friends (name) VALUES ('jesse doe');
INSERT INTO running_friends (name) VALUES ('ruby doe');

