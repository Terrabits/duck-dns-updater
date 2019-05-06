# DuckDNS Updater

This docker image uses the shell utility `watch`, which in turn calls `curl` every five seconds to update your IP address with DuckDNS.

Most of the available implementations of a DuckDNS updater in a docker container (and there are many) use CRON or the init system. To me, this is not a very "Dockerful" approach.

I wanted something with only one running process with output checkable via `docker logs`. If that process dies, docker should know and the process should be restarted at the docker level.

## Example

```shell
docker build -t duck-dns-updater:1.0.0 path/to/duck-dns-updater
docker run -d -e "DOMAINS=<comma-separated-list>" -e "TOKEN=<private-token>" duck-dns-updater:1.0.0
```
