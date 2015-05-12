# More Express
## CRUD And AJAX

| Objectives |
| :---- |
| Review and apply `AJAX` requests with our **Express** application |
| Review and apply DOM manipulation techniques using jQuery. |
| Review CRUD in **Express** to send JSON responses to the server |

## Outline

We want to build a **TODO** application today.

[Something like this](http://todomvc.com/examples/jquery/#/all)


* Review related topics
* Setup Todo Application Directory
* Setup A Simple Hello World
  * Render A `home.html` file
  * Add `jQuery`
* Make a JSON `GET /todos` route
  * Use AJAX to get all `todos`.
* Make a JSON `POST /todos` route
  * Use AJAX to create new `todos`.

## Background

* [jQuery](https://github.com/sf-wdi-18/notes/blob/master/lectures/week-03/ajax_style.md)
* [jQuery DOM manipulation](https://github.com/sf-wdi-18/notes/tree/master/lectures/week-02/day_4_review/dawn_review)
* [jQuery Ajax](https://github.com/sf-wdi-18/notes/blob/master/lectures/week-03/ajax_style.md#ajax)


### Quick Questions

AJAX Related

* What does **AJAX** stand for?
  * Asynchronous JavaScript And XML
* What's the point of **AJAX**?
  * To make requests to a server to dynamically load content into the page or make changes on the server.
* What is `JSON`?
  * **JavaScript Object Notation**: it's just the representation of data using curlies and square brackets: arrays and objects.

Express Related

* What is a web application framework?
  * A library that helps interact with a server to setup easy ways to route request, setup middleware, etc.
* What is Express?
  * Express is a web application framework built to work with the built in Node HTTP server.
* What is Node.js?
  * Node.js or Node is a library that has bunch of utilities to not only allow us to run javascript, but also interact with our operating system and setup a server.

HTTP Related

* What is a `GET` type request?
* What is a `POST` tpe request?
* What is the main difference between the two?


## Getting Started

Let's setup your application directory:

```
mkdir todo_app
cd todo_app
```






