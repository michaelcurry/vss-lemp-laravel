#!/bin/bash

mysql -h localhost -u root -e 'create database app;'
php /vagrant/artisan migrate --package=cartalyst/sentry --env=local
php /vagrant/artisan migrate --env=local
php /vagrant/artisan db:seed --env=local