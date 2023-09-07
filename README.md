# Radicale Docker
![Build Status][b1]
[![Image Size][b2]][1]

Lightweight, very simple Docker image containing a [Radicale][2] CalDAV and
CardDAV server based on [Alpine Linux][3].

Image source at: https://github.com/rockstorm101/radicale-docker


[1]: https://hub.docker.com/r/rockstorm/radicale
[2]: https://radicale.org
[3]: https://www.alpinelinux.org


## Basic Usage

```
docker run -p 5232:5232 -v radicale-data:/var/lib/radicale/collections rockstorm/radicale
```

Your server should be accessible at http://localhost:5232. Any user/password combination
will work.


## Configuration

To configure Radicale simply mount your customized configuration file at
`/etc/radicale/config`.

```
docker run -p 5232:5232 \
    -v radicale-data:/var/lib/radicale/collections \
	-v ./radicale.config:/etc/radicale/config:ro \
	rockstorm/radicale
```


### Manage Users

See [Radicale's documentation][4] on user management. Basically set the
following options on your radicale configuration:

```
[auth]
type = htpasswd
```

And mount your `users` file at `/etc/radicale/users`:
```
docker run -p 5232:5232 \
    -v radicale-data:/var/lib/radicale/collections \
    -v ./radicale.config:/etc/radicale/config:ro \
    -v ./users:/etc/radicale/users:ro \
    rockstorm/radicale
```


[4]: https://radicale.org/v3.html#the-secure-way


## Tags and Variants

This image uses the stable, Alpine-based Nginx Docker image.

 - **'X.Y.Z-bW'**: Immutable tag. Points to a specific image build and will
   not be reused.

 - **'X.Y.Z'**: Stable tag for a specific Radicale version. It follows the
   latest build for Radicale version X.Y.Z and therefore changes with every
   build iteration (e.g. changes on the base Alpine image).

 - **'X.Y'**: Stable tag for specific Radicale major and minor versions. It
   follows the latest build for Radicale version X.Y and therefore changes on
   every patch change (e.g. 1.2.3 to 1.2.4) and every build iteration.

 - **'latest'**: This tag follows the very latest build regardless any
   major/minor versions.


## License

View [license information][5] for the software contained in this image.

As with all Docker images, these likely also contain other software
which may be under other licenses (such as Python, from the base distribution,
along with any direct or indirect dependencies of the primary software being
contained).

As for any pre-built image usage, it is the image user's responsibility to
ensure that any use of this image complies with any relevant licenses for all
software contained within.


[5]: https://github.com/rockstorm101/gitweb-docker/blob/master/LICENSE


[b1]: https://img.shields.io/github/actions/workflow/status/rockstorm101/radicale-docker/test-build.yml
[b2]: https://img.shields.io/docker/image-size/rockstorm/radicale/latest?logo=docker
