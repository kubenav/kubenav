FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.14.4-alpine3.12 as server
RUN apk update && apk add git make
COPY . /kubenav
WORKDIR /kubenav
RUN make build-server

FROM --platform=${BUILDPLATFORM:-linux/amd64} alpine:3.12.0
RUN apk update && apk add --no-cache ca-certificates
COPY ./build /kubenav/build
COPY --from=server /kubenav/bin/server /kubenav
WORKDIR /kubenav
USER nobody
ENTRYPOINT  [ "./server" ]
