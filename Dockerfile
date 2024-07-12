FROM alpine:3.20.1

RUN set -ex; \
    apk add --no-cache \
        radicale=3.1.9-r1 \
        py3-bcrypt \
    ;

COPY radicale.config /etc/radicale/config

EXPOSE 5232

ENTRYPOINT ["radicale"]
CMD ["--debug"]
