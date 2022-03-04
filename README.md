# Flatshare app

![logo](./docs/logo.png)
[![Github Build Status](https://github.com/casi/flatshare_app/workflows/CI/badge.svg)](https://github.com/casi/flatshare_app/workflows/CI/badge.svg)
[![Code Climate](https://codeclimate.com/github/casi/flatshare_app/badges/gpa.svg)](https://codeclimate.com/github/casi/flatshare_app)
[![Test Coverage](https://codeclimate.com/github/casi/flatshare_app/badges/coverage.svg)](https://codeclimate.com/github/casi/flatshare_app/coverage)

This small application lets members of a shared flat manage their shared flat related informations, contracts, house rules, cleaning rota, events etc. (at least that is the plan ;) )

## Getting Started

These instructions will get a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

To start developing you need to have docker and docker-compose installed on your machine

### Installing

After cloning this repository run:

```bash
make setup
```

### First Start

To start/stop/restart the app run:

```bash
make start
make stop
make restart
```

The URL is `http://localhost:3000` and the initial login credentials are

User: `admin@example.org`  
Password: `password`

**Important (especially in a productive environment):** You should **CHANGE** User and Password to your own user mail and password in the user settings - immediately after first login!!!

## Running the tests

To run the whole test suite:

```
make
```

## Deployment

### Heroku

For a deploying the application to Heroku please follow this guide [this guide](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku).

### For plain Linux machine

#### Setting up server for application

In order to ensure that your linux server has the required libraries and docker setup follow the following steps.

1. Update the `ansible/hosts` with your ssh credentials
2. `cd` into ansible folder
3. Run `make setup` and ansible will take over and install all the requirements in oder to run the application. It will also download the application onto the server from github.
4. Once this is complete, ssh onto the server and run `make deploy`

#### Deploying the application

In order to deploy the application on a linux server, initial steps would require one to setup docker and docker compose. After cloning the project to the server you can and then run `make deploy` and the application should start up

## Authors

This project is a work of and maintained by

- Carsten Behnert
- [Cameron Norman](https://github.com/cameronnorman) (co-maintainer)
- ...

I'm still looking for some other contributors to get in touch with for knowledge excange. If YOU like to, feel free to fork this project and send a pull request. :)

## Contributing

If you like to contribute to the project - which I appreciate, please read the guidelines in [CONTRIBUTING.md](CONTRIBUTING.md).
Please respect the [Code of Conduct](CODE_OF_CONDUCT.md).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
