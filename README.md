# TkhSearch

This is a simple Rails gem search engine. It uses the local database for reverse indexing and to log search queries. Multi-model searches are supported.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tkh_search'
```

And then execute:

    $ bundle

Install initializer and migrations:

    $ rake tkh_search:install

Run the migrations:

    $ rake db:migrate


## Indexing the Models

In any model you want to index and search, copy/paste and customize the following code:

```ruby
tkh_searchable
def self.tkh_search_indexable_fields
  indexable_fields = {
    title: 8,
    description: 3,
    body: 2
  }
end
```

Optionally the model may have a _'published?'_ attribute, virtual or not, to later refine admin and public searches.

To index a model's records, use the _'reverse_indexing'_ class method. Example:

```ruby
ModelName.reverse_indexing
```

Having configured all the models you wish to index in your search engine, you can index them all by first setting up the initializer.

```ruby
TkhSearch::TkhSearchable.indexable_models = %w( Page Post Event WhateverYouWant )
```

and secondly, by pointing your browser to: /index_all_models


## Searching your site

### Simple Setup - Searching one model in any given page

Render the basic search form:

```ruby
<%= render 'search/search_form', models_to_search: 'Page' %>
```

By default the search is ajaxified. Just below the form, place a div to host the results:

```html
<div class="js-search-results"></div>
```

### Searching multiple models

Just send the model names to the partial

```ruby
<%= render 'search/search_form', models_to_search: 'Page Post Event' %>
```

### Search form in Bootstrap navbar

There is a form partial to that effect.

```ruby
<%= render 'search/search_form_for_navbar', models_to_search: 'Page' %>
```

### Multiple search forms in a page

In this case you have to tell the gem in which div to render the results.

```ruby
<%= render 'search/search_form', models_to_search: 'Page', results_css_class: 'blog-js-search-results' %>
```

And of course, you need to place a div with the same class name under your form.

### Customize the submit button value


This can also be used for the sake of localization

```ruby
<%= render 'search/search_form', models_to_search: 'Event', submit_label: 'find an awesome event' %>
```


## Missing Features

This gem is brand new and will grow and mature.

Issues and pull requests welcome on Github.



## Contributing

1. Fork it ( https://github.com/[my-github-username]/tkh_search/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
