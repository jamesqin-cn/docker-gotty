FROM docker

EXPOSE 8080

RUN apk add --update go git musl-dev && \
  GOPATH=/go go get github.com/yudai/gotty && \
  cd /go/src/github.com/yudai/gotty && \
  GOPATH=/go CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/bin/gotty && \
  apk del go git musl-dev && \
  cd / && \
  rm -rf /go /var/cache/apk/*

ENTRYPOINT ["/usr/bin/gotty"]
CMD ["--permit-write","--reconnect","/bin/sh"]
