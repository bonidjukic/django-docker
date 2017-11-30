# django-docker
Docker environment consisting of 2 containers, `app` and `db`, to be used for Python/Django and PostgreSQL/PostGIS development.

The stack:
- Python 3.6.3
- Django 1.11.5
- PostgreSQL 9.6.5
- PostGIS 2.4

## Install `docker-compose`

- ```curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose```
- ```chmod +x /usr/local/bin/docker-compose```

Make sure to check the [latest release version](https://github.com/docker/compose/releases) before running the above commands.

## Build and run docker containers

- run `docker-compose up`

## `manage.py`

You can run Django's `manage.py` utility by prepending `docker-compose run app` to the actual command, e.g.:

- `docker-compose run app python manage.py createsuperuser` or
- `docker-compose run app python manage.py migrate`

You can also run `bash` within the container:

e.g. `docker exec -i -t app /bin/bash` (use `exit` to quit `bash`)

## Using the app

Visit [http://localhost:8000](http://localhost:8000)

## Known issues

### `could not access file "$libdir/postgis-X.X"`

When you encouter errors due to the PostGIS' `update OperationalError: could not access file "$libdir/postgis-X.X`, run:

`docker exec postgres update-postgis.sh`

It will update to the newest PostGIS. Update is idempotent, so it won't hurt if ran multiple times.