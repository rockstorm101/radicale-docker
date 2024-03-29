FROM alpine:3.19.1

RUN set -ex; \
    apk add --no-cache \
        radicale=3.1.8-r2 \
    ;

COPY radicale.config /etc/radicale/config

EXPOSE 5232

ENTRYPOINT ["radicale"]
CMD ["--debug"]
