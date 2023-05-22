# OLab 4.5 API Docker Project

This project combines both [`OLab45-Api`](https://github.com/olab/OLab45-Api) and [`OLab45-Common`](https://github.com/olab/OLab45-Common) and is intended to streamline the development process of OLab 4.5 API, also suitable for production deployments.

### Prerequisites

- [Docker engine](https://docs.docker.com/engine/install/)
- `docker-compose` installed separately in case engine doesn't come with the `compose` command (older versions)

### Usage

After cloning the repo, copy:

1. `.env.sample` to `.env`
2. `appsettings.sample.json` to `appsettings.json`

and make any changes. You can then run the containers via the command:

```sh
docker compose up -d
```

Updates are often made to source repos, install them with git submodules:

```sh
# pull changes on default remote branch
git submodule foreach git pull

# or specify a remote branch to use (checkout into it locally)
git submodule foreach git pull origin main
```

To rebuild the API service in case you have updates, run `docker compose build --no-cache`

### Migrations

To run the initial database setup, connect to your container and generate then execute a migration script:

```sh
# ssh into the container
docker-compose run --rm --entrypoint=/bin/sh olab-api

# run the following commands and exit
cd /usr/src/app/Common/Data
dotnet ef --startup-project ./../../Api/WebApiService migrations add Initial -c OLabDBContext
dotnet ef --startup-project ./../../Api/WebApiService database update -c OLabDBContext
```
