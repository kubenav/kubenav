#FROM --platform=linux/amd64 node:13 as build
#COPY . /kubenav
#WORKDIR /kubenav
#RUN npm install -g ionic
#RUN npm install
#ENV REACT_APP_SERVER true
#RUN ionic build

FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.14.4-alpine3.12 as server
ARG TARGETPLATFORM
RUN apk update && apk add git make
COPY . /kubenav
WORKDIR /kubenav
RUN make build-server

FROM --platform=${TARGETPLATFORM:-linux/amd64} alpine:3.12.0
RUN apk update && apk add --no-cache ca-certificates
RUN mkdir /kubenav
#COPY --from=build /kubenav/build /kubenav/build
COPY --from=server /kubenav/bin/server /kubenav
WORKDIR /kubenav
USER nobody
ENTRYPOINT  [ "./server" ]
