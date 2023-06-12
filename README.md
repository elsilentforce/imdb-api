# README

## Summary
This API provides a set of endpoints for searching movies and saving some personal apreciations.

## Requisites
Since this API uses some background jobs and implements some cache operations, you need:

* Redis Server

## How to run
This API can be started just executing the following commands:

For Redis server:
```
redis-server
```
Once the server is running you can start Sidekiq for watching background queues (such as email sending) with:
```
bundle exec sidekiq
```
Once both previous services are running, you can start the API by executing:
```
rails s
```

## API Documentation
Once your local API is running you can check the documentation at:
```
http://localhost:3000/api-docs
```
