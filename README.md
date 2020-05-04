# Flatshare app
![logo](./docs/logo.png)

[![Build Status](https://travis-ci.org/casi/flatshare_app.svg?branch=master)](https://travis-ci.org/casi/flatshare_app)
[![Code Climate](https://codeclimate.com/github/casi/flatshare_app/badges/gpa.svg)](https://codeclimate.com/github/casi/flatshare_app)
[![Test Coverage](https://codeclimate.com/github/casi/flatshare_app/badges/coverage.svg)](https://codeclimate.com/github/casi/flatshare_app/coverage)

This small application (written with **Rails 5**) lets members of a shared flat manage their shared flat related informations, contracts, house rules, cleaning rota, events etc. (at least that is the plan ;) )

## Getting Started

These instructions will get a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To start developing you need to have docker and docker-compose installed on your machine

### Installing

After cloning this repository run:

```
make setup
```

## Running the tests

To run the whole test suite:

```
make test
```

## Deployment

### Heroku
For a deploying the application to Heroku please follow this guide [this guide](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku).

### For plain Linux machine
In order to deploy the application on a linux server, initial steps would require one to setup docker and docker compose. After cloning the project to the server you can and then run `make deploy` and the application should start up

## Authors

This project is a work of and maintained by Carsten Behnert. Looking for some other contributors to get in touch with for knowledge excange. If YOU like to, feel free to fork this project and send a pull request. :)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### TODOs

v1.0:

- [ ] Basic Admin Interface
- [ ] Full Test Coverage (!!!)

v1.1:

- [ ] Cashpoint Manager
- [ ] Housework Rota (dynamic)
- [ ] Calendar (Events etc)
