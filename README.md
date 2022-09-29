# Jungle

A fully functional mini e-commerce application built with Ruby and Rails 6.1. 

This is my sixth project at Lighthouse Labs, after [Lotide](https://github.com/sylvielcq/lotide), [TinyApp](https://github.com/sylvielcq/tinyapp), [Tweeter](https://github.com/sylvielcq/tweeter-app), midtem project [Flavour Labs](https://github.com/sylvielcq/Flavour-Labs) and [Interview Scheduler](https://github.com/sylvielcq/scheduler).

## Features

* Users can browse products, add items to cart, and process their purchase with a credit/debit card.
* Users can sign up and log in.
* Admins can log in, browse their Admin dashboard, add new products, add new categories.

## Final Product

### Browse products and add to cart
![add-to-cart](https://github.com/sylvielcq/jungle-rails/blob/master/docs/jungle-add-to-cart.gif?raw=true)

### Admin - Products
![admin-products](https://github.com/sylvielcq/jungle-rails/blob/master/docs/jungle-admin.gif?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
