# HTML Templating

| Objectives |
| :---- |
| Evaluate different approaches to rendering data in the frontend |
| Explore templating using underscore |
| Separate control logic from view logic |

### Keywords

* Concatination
* Interpolation
* Seperation of Concerns
* View Logic --> html, and templating logic

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
       $target.append($newEl.show());
    ```

* The **"Templating"** Approach: Put your template HTML in a script tag in the DOM. Grab its html, compile it, and swap out its values using interpolation.
    - We'll explore the underscore documentation together to figure it out!
    - [Underscore's Template Utility Method](http://underscorejs.org/#template)

## Let's try it out!

Today we will be working together to complete this lab:

[templating_lab](https://github.com/sf-wdi-18/templating_lab)





<br><br><br>
#SPOILERS --> NO PEEKING
<br><br><br>


Template in `script` tag below the `body`:
```
<script type="text/template" id="tmpl-loop-example">
  <p>
    <h4><%= name %></h4>
    <% list.forEach(function(item){ %>
      <strong><%= item %></strong>
    <% }) %>
  </p>
</script>
```

Underscore templating:
```
var myData = {name: "Garbanzo", list: ["hello", "world"]}
var tmpl_str = $("#tmpl-loop-example").html();
var compile = _.template(tmpl_str); // returns a function!
var html_str = compile(myData);
$("body").html(html_str)
```