# README

To run Swagger using Docker please execute:
```
docker run --rm -p 8080:8080 -v $(pwd)/swagger.yaml:/swagger.yaml -e SWAGGER_JSON=/swagger.yaml swaggerapi/swagger-ui
```
