# docker-samvera

The Docker-Samvera project sets up the Californica (Hyrax) and Ursus (Blacklight) environments for developers.

## Prerequisites

The developer environment created by docker-samvera relies on Docker Engine and Docker Compose. Make sure you're running the latest versions.

Installation or upgrade instructions for [Docker Compose](https://docs.docker.com/compose/install/) and [Docker Engine](https://docs.docker.com/install/) are available on their respective sites.

## Getting started

The first thing you need to do is to download the `samvera-docker`, `californica`, and `ursus` GitHub repos:

    git clone git@github.com:andrewbenedictwallace/samvera-docker.git
    cd samvera-docker
    git submodule init
    git submodule update --recursive --remote

After that, you can run `docker-compose` to bring up the development environment:

    docker-compose up

The first time you create the environment, you'll also need to provision the Californica and Ursus databases. From within the `samvera-docker` directory, run:

    docker-compose run californica bash
    bundle exec rake db:setup
    bundle exec rake californica:ingest:sample

If this succeeds without error, you've successfully created your Californica environment and loaded some sample records.

Next, you can exit from the Californica container (or just open a new terminal on your host machine) and set up the Ursus database: 

    docker-compose run ursus bash
    bundle exec rake db:setup

After this succeeds, you have a working development environment.

To access some of the services that you'll need, try finding them at the following locations:

* Californica -> http://172.17.0.1:3000/
* Ursus -> http://172.17.0.1:3003/
* Fedora -> http://172.17.0.1:8080/fcrepo/rest
* Solr -> http://172.17.0.1:8983/solr/#/

## Contact

If you have any questions or encounter any problems, feel free to contact [Andy](https://github.com/andrewbenedictwallace) (or "Andrew Wallace" on UCLA's Slack) for assistance.
