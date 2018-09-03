FROM golang:1.9.2-alpine3.6 AS build
# FROM golang:1.10 AS builder
# FROM golang:alpine as builder

LABEL MAINTAINER="Teerapong Singthong <teerapong.s@linecorp.com>"

# ======================================================
# (1) Install dep dependency tool
# ======================================================
RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

# ======================================================
# (2) Gopkg.toml Gopkg.lock lists project dependencies
# These layers will only be re-built 
# when Gopkg files are updated
# ======================================================
COPY Gopkg.lock Gopkg.toml /go/src/project/apigw/
WORKDIR /go/src/project/apigw/

# ======================================================
# (3) Install library dependencies
# ======================================================
RUN dep ensure -vendor-only

# ======================================================
# (4) Copy all project and build it
# This layer will be rebuilt when ever a file 
# has changed in the project directory
# ======================================================
COPY . /go/src/project/apigw/
# RUN go build -o /go/bin/project
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /go/bin/project
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix nocgo -o /app .
CMD ["/go/bin/project"]


# ======================================================
# (5) Multi stage to run
# ======================================================
# FROM scratch
# COPY --from=build /go/bin/project /go/bin/project
# ENTRYPOINT ["/go/bin/project"]