# Phase 1

Implement the Ruby API where I could generate HTML like this:

``` ruby
html do
 tag :h1 do
   text "Hello World"
 end
 tag :p do
   text "Lorem Ipsum"
   tag :br
   tag :strong do
     text "Dolor et!"
   end
 end
end
```

No need for:

* HTML escaping
* Tag attributes

# Phase 2

Add the indentation to the generated HTML with tab or double space for each opened tag


# Phase 3

Implement the following API

``` ruby
article = html do
  # same code as above
end

article.change(:p, :strong) do
  tag(:em) do
    text "Dolor et!"
  end
end
```
  
