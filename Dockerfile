FROM docker:dind

EXPOSE 8080

ADD gotty-entrypint.sh /usr/local/bin/gotty-entrypint.sh

RUN chmod +x /usr/local/bin/gotty-entrypint.sh && \
  apk add --update go git musl-dev && \
  GOPATH=/go go get github.com/yudai/gotty && \
  cd /go/src/github.com/yudai/gotty && \
  GOPATH=/go CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /usr/local/bin/gotty && \
  apk del go git musl-dev && \
  cd / && \
  rm -rf /go /var/cache/apk/* \

ENTRYPOINT ["/usr/local/bin/gotty-entrypint.sh"]
