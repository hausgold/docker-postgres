![mDNS enabled official/postgres](docs/assets/project.png)

This Docker images provides the
[official/postgres](https://hub.docker.com/_/postgres/)
image as base with the mDNS/ZeroConf stack on top. So you can enjoy
[postgres](https://postgres.me/) while it is accessible by default as
*postgres.local*. (Port 5432)

## Requirements

* Host enabled Avahi daemon
* Host enabled mDNS NSS lookup

## Getting starting

You just need to run it like that, to get a working postgres:

```bash
$ docker run --rm hausgold/postgres
```

The port 5432 is untouched.

## docker-compose usage example

```yaml
postgres:
  image: hausgold/postgres
  environment:
    # Mind the .local suffix
    - MDNS_HOSTNAME=postgres.test.local
  ports:
    # The ports are just for you to know when configure your
    # container links, on depended containers
    - "5432"
```

## Host configs

Install the nss-mdns package, enable and start the avahi-daemon.service. Then,
edit the file /etc/nsswitch.conf and change the hosts line like this:

```bash
hosts: ... mdns4_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns ...
```

## Configure a different mDNS hostname

The magic environment variable is *MDNS_HOSTNAME*. Just pass it like that to
your docker run command:

```bash
$ docker run --rm -e MDNS_HOSTNAME=something.else.local hausgold/postgres
```

This will result in *something.else.local*.

## Other top level domains

By default *.local* is the default mDNS top level domain. This images does not
force you to use it. But if you do not use the default *.local* top level
domain, you need to [configure your host avahi
configuration](https://wiki.archlinux.org/index.php/avahi#Configuring_mDNS_for_custom_TLD)
to accept it.

## Further reading

* Docker/mDNS demo: https://github.com/Jack12816/docker-mdns
* Archlinux howto: https://wiki.archlinux.org/index.php/avahi
* Ubuntu/Debian howto: https://wiki.ubuntuusers.de/Avahi/
