# Dockerized app connect to system DB

https://stackoverflow.com/a/24326540/3102718

## Build image

~~~sh
docker build -t orders-test .
~~~

## Run container

https://docs-stage.docker.com/reference/cli/docker/container/exec/

~~~sh
docker run --name orderscontainer -d -i -t \
  -e DB_HOST=host.docker.internal \
  orders-test /bin/sh
~~~

~~~sh
docker ps
~~~

## Exec in contaner

~~~sh
docker exec -it orderscontainer pry
docker exec -it orderscontainer ruby orders_db.rb
docker exec -it orderscontainer /bin/sh
~~~
