# OLab 4.6 API Docker Project

This project combines both [`OLab45-Api`](https://github.com/olab/OLab45-Api) and [`OLab45-Common`](https://github.com/olab/OLab45-Common) and is intended to streamline the development process of OLab 4.5 API, also suitable for production deployments.

### Prerequisites

- [Docker engine](https://docs.docker.com/engine/install/)
- docker-compose installed separately in case engine doesn't come with the `compose` command (older versions)

### Usage

After cloning the repo, copy `.env.sample` to `.env` and make any changes. You can then run the containers via the command:

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

To install any updates fetched from the previous step, you can use `docker compose build --no-cache`

### Migrations

This is a required step for the API service to work, it needs support from the project author. Either create an issue at `olab/OLab45-Common` or try hacking something with `dotnet ef` or a direct migration call attached to the application `Startup.cs`. DB models can be found at `OLab45-Common/Data`
