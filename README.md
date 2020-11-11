# README

## Overview
Sweater Weather is a back-end rails program that creates a series of API endpoints that allows a fictional front-end team to create a front-end program that allows users to create a road trip and see the current weather as well as the forecasted weather at the destination.

## Local Setup
- Fork and Clone this repository
- Clone the repository on to your local computer
    - Run bundle
    - Run bundle exec figaro install
- Obtain API keys for the following:
    * [MapQuest](https://www.mapquestapi.com)
    * [OpenWeather](http://api.openweathermap.org)
    * [Microsoft Azure](https://portal.azure.com)
- Once you have these, API keys, place them in your application.yml file

## Versions
![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a) ![](https://img.shields.io/badge/Ruby-2.5.3-orange) ![](https://img.shields.io/badge/SIMPLECOV-100%25-blue)

## Database
Sweater Weather has a database that holds a Users table. This is used in order for a User to register and login. The remainder of the objects that are created in here are PORO's.

## How to test the API endpoints
In the terminal, once ```CD'd``` into the Sweater Weather repository, run ```rails s```.

This following part is best done using Postman:
    * ```http://localhost:3000``` is the beginning of the URL, make sure to append the API endpoints that you wish to test (ex... ```/api/v1/forecast```) as well as the required paramaters.
    * Do this for the rest of the API endpoints you wish to test and enjoy. (If this becomes cumbersome, simply run rspec in the terminal after exiting from the rails s session.)

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Research, select, and consume an API based on your needs as a developer