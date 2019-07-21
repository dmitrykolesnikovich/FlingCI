# Jenkins and docker integration

I followed [this](https://technology.riotgames.com/news/putting-jenkins-docker-container) guide from Riot Games to get started. 

# Getting Started

There is a make file for simple usage of this setup

* `make build`
* `make run`
* `make stop`
* `make clean-data`
* `make clean-images`
* `make ps`

These commands all just end up running `docker-compose` commands, so if you don't want to use make
then just use docker.

You can run `catPasswd.sh` for a quick and easy way to get your inital Jenkins setup password. 