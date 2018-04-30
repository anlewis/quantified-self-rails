# Quantified Self

[![Coverage Status](https://coveralls.io/repos/github/anlewis/quantified_self_rails/badge.svg?branch=master)](https://coveralls.io/github/anlewis/quantified_self_rails?branch=master)
[![CircleCI](https://circleci.com/gh/anlewis/quantified_self_rails.svg?style=svg)](https://circleci.com/gh/anlewis/quantified_self_rails)
[![Waffle.io](https://badge.waffle.io/anlewis/quantified_self_rails.png?columns=all)](https://waffle.io/anlewis/quantified_self_rails?utm_source=badge)

### About

Quantified self is a simple calorie tracking application.

### Learning Goals
- Create a Rails API given specified endpoints and response formats.
- Create an Express API given specified endpoints and response formats.
- Create an API in a new language of the students choice given specified endpoints and response formats.
- Review and refactor code (in each of the three languages) so that it:
  - is well organized
  - clearly communicates intent
  - utilizes abstraction to hide complexity
  - breaks problems down into small methods/functions with a single responsibility

### Getting Started

This project uses the Ruby on Rails framework, which can be installed from [here](http://installrails.com/).
[Bundler](http://bundler.io/) is used to install the gems needed for this application.

In order to run this appication in the development environment, perform the following in the CLI:

```
bundle install
rake db:create db:seed db:migrate
```

In order to spin-up the server, run: `rails s`

### Testing

[Rspec-Rails](https://github.com/rspec/rspec-rails) is used for testing.

In order to run tests, perform the following:

`rake db:test:prepare`

`rspec`

### API Endpoints

Quantified Self will have the following endpoints:

Food Endpoints:
- `GET /api/v1/foods`
- `GET /api/v1/foods/:id`
- `PATCH /api/v1/foods/:id`
- `DELETE /api/v1/foods/:id`

Meal Endpoints:
- `GET /api/v1/meals`
- `GET /api/v1/meals/:meal_id/foods`
- `POST /api/v1/meals/:meal_id/foods/:id`
- `DELETE /api/v1/meals/:meal_id/foods/:id`
