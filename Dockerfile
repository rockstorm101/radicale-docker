FROM alpine:3.20.0

RUN set -ex; \
    apk add --no-cache \
        radicale=3.1.9-r1 \
    ;

COPY radicale.config /etc/radicale/config

EXPOSE 5232

ENTRYPOINT ["radicale"]
CMD ["--debug"]
