# README

## installation

* Ruby version 2.5.3

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions



## System dependencies (gems)


for api part add dependency to

```ruby
gem 'active_model_serializers'
```


## TODO

* at api/v1/authors_controller.rb remove

```ruby
skip_before_action :verify_authenticity_token
```
* add test for api/v1/authors_controller.rb


* at api/v1/books_controller.rb remove

```ruby
skip_before_action :verify_authenticity_token
```
* add test for api/v1/books_controller.rb
