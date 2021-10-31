# Docker MongoDB
- Support docker compose.
- Support database replication.

## Quick Start

- Clone `.env.sample` to `.env` in the same directory and update configuration for project.
- Generate key file for authentication: `openssl rand -base64 700 > shared.key`.
- Set permission: `chmod 400 shared.key && chmod +x setup.sh`.
- Start docker container: `docker-compose up` or `docker-compose up -d`.
- Initial replica set and user authentication by command: `docker exec mongo1 /setup.sh`.
- To use on localhost, we have to configure into `/etc/hosts`:
```
127.0.0.1       mongo1
127.0.0.1       mongo2
127.0.0.1       mongo3
```
- Connect to database by uri: `mongodb://[username]:[password]@localhost:30001,localhost:30002,localhost:30003/?replicaSet=rs0`.
- Access to Mongo Express with http://localhost:8282
- Refer to docker compose document in [here](https://docs.docker.com/compose/overview/#compose-documentation).
