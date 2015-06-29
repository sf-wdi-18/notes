#Sassy Mocks

###Requirements

* Implement *one* of these designs in a Rails app
* Use a `welcome#index` page to house the designs
* Use the asset pipeline appropriately
* Use partials to organize your styles
* Aim to leverage the power of [Sass](http://sass-lang.com/) to DRY-up your code

###Goal

Choose one of the three options that are sorted by difficulty

**Brooklyn** — Store landing page

![brooklyn](brooklyn/mockup.png)

**Instagram** — Company landing page

![brooklyn](ecardly/mockup.png)

**eCardly** — Blog template

![brooklyn](instagram/mockup.png)

###Sass

 <img style="width: 250px"src="http://i.giphy.com/CvWtIx26knFDy.gif"/>

Sass is a CSS preprocessor. Developers value Sass because it is easier to write than CSS, but can be easily [transpiled](https://en.wikipedia.org/wiki/Source-to-source_compiler), aka translated, into CSS.

* Created by [Hampton Catlin](https://en.wikipedia.org/wiki/Hampton_Catlin)
* Open source project implemented in Ruby

###Sassy Features

**Variables**

You can declare a variable with `$`. Here's how you would set a variable `$primary-color` to the value `hotpink`.

```sass
$primary-color: hotpink;
.my-element {
    color: $primary-color;
    width: 100%;
    overflow: hidden;
}
```

will result in...



**Nesting**

Sass let's you nest CSS selectors in the same way you nest HTML.

Note that highly nested Sass results non-modular CSS which can be bad practice.


```sass
nav {
  /* targets the `ul` inside the nav */
  ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }
  /* targets all `li`'s inside the ul */
  li { display: inline-block; }

  a {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
  }
}
```

will result in...

```css
nav ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

nav li {
  display: inline-block;
}

nav a {
  display: block;
  padding: 6px 12px;
  text-decoration: none;
}
```

**Partials**

Partials are a great way to organize and modularize your styles. This ends up increasing the maintainability & scalability of any project.

You can create a new partial with an underscore, such as `_partial.scss` and require it with the `@import` keyword. You can import single files or entire folders.

**Mixins**

Mixins are chunks of code that you plan on reusing. If they take argument they will output dynamic CSS.

Image we want to specify an unstandardized CSS attribute. Rather than writing out all the vendor prefixes for each browser type every time we add a property to that attribute, we could create a mixin to DRY this code up.

```sass
@mixin border-radius($radius) {
  -webkit-border-radius: $radius;
     -moz-border-radius: $radius;
      -ms-border-radius: $radius;
          border-radius: $radius;
}

.box { @include border-radius(10px); }
```

will result in...

```css
.box {
  -webkit-border-radius: 10px;
  -moz-border-radius: 10px;
  -ms-border-radius: 10px;
  border-radius: 10px;
}
```

###Sass & Rails

* Rails uses Sass with a `.scss` extension.
* A Sass file understands *both* Sass & CSS
* Rails compiles the file to CSS automatically for you



###Further Sass Resources

* [sass-lang Guide](http://sass-lang.com/guide) — Intro to Sass
* [sass-rails gem docs](https://github.com/rails/sass-rails) — Reference for how to use Sass with Rails
* [The Sass Way best practices](http://thesassway.com/beginner) — Great resource for all things Sass from beginner concept introductions to advanced best practices.