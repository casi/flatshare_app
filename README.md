# Flatshare app

[![Build Status](https://travis-ci.org/casi/flatshare_app.svg?branch=master)](https://travis-ci.org/casi/flatshare_app)
[![Code Climate](https://codeclimate.com/github/casi/flatshare_app/badges/gpa.svg)](https://codeclimate.com/github/casi/flatshare_app)
[![Test Coverage](https://codeclimate.com/github/casi/flatshare_app/badges/coverage.svg)](https://codeclimate.com/github/casi/flatshare_app/coverage)

This small application (written with brand new **Rails 5**) lets members of a shared flat manage their shared flat related informations, contracts, house rules, cleaning rota, events etc. (at least that is the plan ;) )

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To start developing you need a running version of **Ruby (at least 2.3.1)** on your local machine.

### Installing

After cloning this repository run:

```
cp .env.dist .env
bundle install
```

**OR** if you want to use the Docker integration for development:

```
docker-compose up bundle
```

do the database setup (migrate and seed)

```
rails db:setup
```

start the local webserver

```
rails s
```

**OR** if you want to use the Docker integration for development:

```
docker-compose up -d app
```

and have fun testing it out (http://localhost:3000/)! ;)

## Running the tests

To run the whole test suite:

```
rails test
```

## Deployment

For a deployment example please read [devcenter on heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku) for installing on the popular Rails hoster or the respective manuals from your Rails hosting provider.

### Build application base + development docker images

    docker build -f docker/app/base/Dockerfile -t casi257/app-fs:1.0-base docker/app/base/
    docker build -f docker/app/dev/Dockerfile -t casi257/app-fs:1.0-dev docker/app/dev/

### (WIP) Steps

- `git checkout` the branch / tag you want to deploy
- build image `docker build --tag casi/app-fs:latest .`
- push image to registry `docker push casi/app-fs:latest`
- create `.env` for production use
- upload `docker-compose.yml` and `docker-compose.prod.yml`
- run `docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d`

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
