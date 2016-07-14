# Flatshare app

This small application (written with brand new **Rails 5**) lets members of a shared flat manage their shared flat related informations, contracts, house rules, cleaning rota, events etc. (at least that is the plan ;) )

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisities

To start developing you need a running version of **Ruby (at least 2.3.0)** on your local machine.

### Installing

After cloning this repository run:

```
bundle install
```
do the database setup (migrate and seed)

```
rake db:setup
```
start the local webserver

```
rails s
```
and have fun testing it out! ;)

## Running the tests

To run the whole test suite:

```
rails test
```
## Deployment

For a deployment example please read [devcenter on heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku) for installing on the popular Rails hoster or the respective manuals from your Rails hosting provider.

## Authors

This project is a work of and maintained by Carsten Behnert. Looking for some other contributors to get in touch with for knowledge excange. If YOU like to, feel free to fork this project and send a pull request. :)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

### TODO:
v1.0: 

- [ ] News Archive 
- [ ] Housework Rota (static)

v1.1:

- [ ] Calendar (Events etc)
- [ ] Housework Rota (dynamic)
