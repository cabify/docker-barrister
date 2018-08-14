FROM golang:1.9.2-alpine3.7 as barrister-go-builder

RUN apk --no-cache add git

ENV CGO_ENABLED=0

RUN mkdir -p /go/src/github.com/coopernurse && \
    cd /go/src/github.com/coopernurse/ && \
    git clone --single-branch -b toni.cardenas/context-support https://github.com/cabify/barrister-go.git 
RUN go install github.com/coopernurse/barrister-go/idl2go

FROM alpine:3.7

RUN apk --no-cache add py-pip

ENV BARRISTER_VERSION=0.1.6

RUN pip install "barrister==$BARRISTER_VERSION"

COPY --from=barrister-go-builder /go/bin/idl2go /bin/idl2go
COPY barrister2go /bin/

