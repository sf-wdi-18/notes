# Templating & Get

| Objectives |
| :---- |
| Evaluate different approaches to rendering data in the frontend |
| Explore templating using underscore  |
| Build a node app that accepts a GET request and returns a list of items for us to render |

## What's this all about?

Creating HTML documents is easy if we hard code our data. But this quickly becomes a pain-point. HTML is full of repetition and can be hard to change. Templates allow us to be smart about reusing code. They also allow us to have "dynamic" as opposed to "staic" ("hard-coded") content.

## Approaches to Templating

* The **"HTML String"** Approach: Create a nasty html string in your javascript file and then add it to the DOM.

    ```
       $target.html("<p>" + "Hello World" + "</p>")
    ```

* The **"Placeholder"** Approach: Target an existing element in the DOM, and swap out its values using javascript

    ```
       $el.text("New Title to Replace Placeholder")
    ```

* The **"Clone-And-Show"** Approach: Target an existing *hidden* placeholder element in the DOM, then `clone`, swap out values using javascript, and `show`.

    ```
       $newEl = $template.clone().text("New Dynamic Title");
       $target.append($newEl).show();
    ```

* The **"Template"** Approach: Put your template HTML in a script tag in the DOM. Grab its html, compile it, and swap out its values using interpolation.
    - We'll explore the underscore documentation together to figure it out!
    - [Underscore's Template Utility Method](http://underscorejs.org/#template)

## Let's try it out!

Today we will be working together to complete this lab:

[templating_lab](https://github.com/sf-wdi-18/templating_lab)
