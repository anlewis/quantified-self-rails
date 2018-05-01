# Quantified Self

[![Coverage Status](https://coveralls.io/repos/github/anlewis/quantified-self-rails/badge.svg?branch=master)](https://coveralls.io/github/anlewis/quantified-self-rails?branch=master)
[![CircleCI](https://circleci.com/gh/anlewis/quantified-self-rails.svg?style=shield)](https://circleci.com/gh/anlewis/quantified-self-rails)
[![Waffle.io](https://badge.waffle.io/anlewis/quantified-self-rails.svg?columns=all)](https://waffle.io/anlewis/quantified-self-rails)

### About

Quantified self is a simple calorie tracking application. It is used as a learning experience in using multiple languages and seperating backend and frontend services. This is the Rails backend API component.

### Getting Started

This project uses the Ruby on Rails framework, which can be installed [here](http://installrails.com/).
[Bundler](http://bundler.io/) is used to install the gems needed for this application.

In order to run this appication in the development environment, perform the following in the CLI:

```
bundle install
rake db:create db:migrate db:seed
```

In order to spin-up the server, run: `rails s`

The frontend component can be found at: [quantified-self-fe](https://github.com/anlewis/quantified-self-fe). Follow the instructions in the Readme to spin up a server locally.

This application is also in production. The base Heroku URI is (https://qs-rails.herokuapp.com). In order to access the endpoints, use `/api/v1/ENDPOINT`.

Example: (https://qs-rails.herokuapp.com/api/v1/foods.json)

To view with the frontend component, visit the [Github Page](https://anlewis.github.io/quantified-self-fe/)

### Learning Goals
- Create a Rails API given specified endpoints and response formats.
- Create an Express API given specified endpoints and response formats.
- Create an API in a new language of the students choice given specified endpoints and response formats.
- Review and refactor code (in each of the three languages) so that it:
  - is well organized
  - clearly communicates intent
  - utilizes abstraction to hide complexity
  - breaks problems down into small methods/functions with a single responsibility

### Database

The following schema was used to create a [PostgreSQL](https://www.postgresql.org/) database:

![schema](https://preview.ibb.co/e3J3ES/Screenshot_2018_05_01_17_12_51.png)

### Testing

[Rspec-Rails](https://github.com/rspec/rspec-rails) is used for testing. [FactoryBot](https://github.com/thoughtbot/factory_bot) is used to create test data, and [Shoulda Matchers](https://github.com/thoughtbot/shoulda-matchers) is used to test validations on the models.

In order to run tests, perform the following:

`rake db:test:prepare`

`rspec`

### API Endpoints

Quantified Self will have the following endpoints:

#### Food Endpoints
- `GET /api/v1/foods`: Returns all foods currently in the database

```
{
    "id": 1,
    "name": "Banana",
    "calories": 150
}
```

- `GET /api/v1/foods/:id` Returns the food object with the specific :id you’ve passed in or 404 if the food is not found.

- `POST /api/v1/foods` Allows creating a new food with the parameters:

```
{ "food": { "name": "Name of food here", "calories": "Calories here"} }
```

- `PATCH /api/v1/foods/:id` Allows one to update an existing food with the parameters:

```
{ "food": { "name": "Mint", "calories": "14"} }
```

- `DELETE /api/v1/foods/:id` Will delete the food with the id passed in and return a 204 status code. If the food can’t be found, a 404 will be returned.

#### Meal Endpoints
- `GET /api/v1/meals` Returns all the meals in the database along with their associated foods.

```
[
    {
        "id": 1,
        "name": "Breakfast",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            },
            {
                "id": 6,
                "name": "Yogurt",
                "calories": 550
            },
            {
                "id": 12,
                "name": "Apple",
                "calories": 220
            }
        ]
    },
    {
        "id": 4,
        "name": "Dinner",
        "foods": [
            {
                "id": 1,
                "name": "Banana",
                "calories": 150
            },
            {
                "id": 2,
                "name": "Bagel Bites - Four Cheese",
                "calories": 650
            }
        ]
    }
]
```

- `GET /api/v1/meals/:meal_id/foods` Returns all the foods associated with the meal with an id specified by :meal_id or a 404 if the meal is not found.

```
{
    "id": 1,
    "name": "Breakfast",
    "foods": [
        {
            "id": 1,
            "name": "Banana",
            "calories": 150
        },
        {
            "id": 6,
            "name": "Yogurt",
            "calories": 550
        }
    ]
}
```

- `POST /api/v1/meals/:meal_id/foods/:id` Adds the food with :id to the meal with :meal_id. This returns:

```
{
    "message": "Successfully added FOODNAME to MEALNAME"
}
```

- `DELETE /api/v1/meals/:meal_id/foods/:id` Removes the food with :id from the meal with :meal_id. This returns:

```
{
    "message": "Successfully removed FOODNAME to MEALNAME"
}
```
