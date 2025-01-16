FROM alpine:3.21.2

RUN set -ex; \
    apk add --no-cache \
        radicale=3.3.0-r0 \
        py3-bcrypt \
    ;

COPY radicale.config /etc/radicale/config

EXPOSE 5232

ENTRYPOINT ["radicale"]
CMD ["--debug"]
