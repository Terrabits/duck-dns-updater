FROM alpine:3.9.3
RUN apk update && apk upgrade && apk add curl
COPY update-duck-dns /
ENTRYPOINT ["/bin/watch", "-n", "5", "-t", "/update-duck-dns"]
