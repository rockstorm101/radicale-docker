FROM alpine:3.22.0

RUN set -ex; \
    apk add --no-cache \
        radicale=3.5.4-r0 \
        py3-bcrypt \
    ;

COPY radicale.config /etc/radicale/config

EXPOSE 5232

ENTRYPOINT ["radicale"]
CMD ["--debug"]
