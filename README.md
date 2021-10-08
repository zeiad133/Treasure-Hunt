# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you need to download:

* docker

To Run the Project

* remove .copy from .env.copy to add the .env file
* docker-compose up
* navigate to http://localhost:8000/api-docs/index.html for swagger docs
* navigate to http://localhost:1080/ for mailcatcher so you test emails

To Run tests

* docker exec -it container_name rspec

Bonus points covered:
* Api authentication
* Unit and integration tests
* Analytics
* Allow only 20 requests per hour
* add docker so you can test all features easily
