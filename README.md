# Project: Appointments Api

> A database-driven RESTful web API for managing appointment 
resources

#### For API Documentation visit [here](https://github.com/philetos/appointments/blob/master/doc/api/main.md)

## Dependencies

* Bundler (1.5.3)
* Rails (4.1.4)
* Ruby (2.0.0)
* [PostgreSQL](http://www.postgresql.org/)

## Setup

To run the app..

1. Clone this repo
2. Install non-gem dependencies above
3. Install gems with `bundle install`
4. Run `rake setup` to setup database, migrate, populate seeds, and import data.

## Testing

This api is tested using RSpec. To run the test suite, `bundle install` then run:

    $ rspec spec