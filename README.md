# ZomboDB and PostGIS

This [Dockerfile](./Dockerfile) builds a PostgreSQL image that contains the code for the [PostGIS](https://postgis.net/) and [ZomboDB](https://github.com/zombodb/zombodb) extensions.

## PostGIS

PostGIS is included to enable spatial query - e.g. proximity between two points by latitude and longitude.

## ZomboDB

[ZomboDB](https://github.com/zombodb/zombodb) is a PostgreSQL extension that provides a database-oriented integration with Elasticsearch. 

Rather than copying domain objects/documents into BOTH your database and Elasticsearch from your API and struggling to keep them in-sync, instead you can define custom column types that will automatically copy data into Elasticsearch. Your API need never know!