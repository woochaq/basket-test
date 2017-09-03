# README

## Requirements

```
Ruby 2.4.1
Mysql database server
```

## How to run the project

```
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
visit http://localhost:3000
credentials: test@example.com/123qweasd
```

## Running tests
```
rspec spec
```

## Brief summary

```
User can add products to cart one at the time.
User can remove products from cart one at the time.
Credit card number must be valid, i.e. 378282246310005
```
