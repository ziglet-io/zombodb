FROM postgres:12.5
LABEL maintainer="jeff@ziglet.io"

# --------------------------------------------------------------------------------
# This docker image builds a PostgreSQL database containing
# PostGIS and ZomboDB extensions.
#
# PostGIS (https://postgis.net/) offers spatial query features
#
# ZomboDB (https://github.com/zombodb/zombodb) offers integration with 
# ElasticSearch.
# 
# WARNING building this docker image takes a LONG time as it is compiling parts of 
# PostgreSQL and all of ZomboDB.

# Install packages required to build zombodb
RUN apt-get update
RUN apt-get install -y \
    git \
    bison \
    flex \
    zlib1g \
    zlib1g-dev \
    pkg-config \
    libssl-dev \
    libreadline-dev \
    build-essential \
    curl \
    postgresql-server-dev-12 

# Install the postgis extensions
RUN apt-get install -y postgis*

# Get/install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install cargo-pgx

# Get Zombodb and build
RUN git clone https://github.com/zombodb/zombodb.git
WORKDIR zombodb
RUN cargo pgx init
RUN cargo pgx install --release

