FROM --platform=linux/amd64 node:14 as build
WORKDIR /kubenav
RUN npm install -g @ionic/cli
COPY package.json package-lock.json /kubenav/
RUN npm install
ENV REACT_APP_INCLUSTER true
COPY public /kubenav/public
COPY src /kubenav/src
COPY .eslintrc.json .prettierrc.json capacitor.config.json ionic.config.json tsconfig.json /kubenav/
RUN ionic build

FROM golang:1.17.3-alpine3.15 as server
ARG TARGETPLATFORM
ARG BUILDPLATFORM
RUN echo "Building on $BUILDPLATFORM, for $TARGETPLATFORM" > /log
RUN apk update && apk add git make
WORKDIR /kubenav
COPY go.mod go.sum /kubenav/
RUN go mod download
COPY .git /kubenav/.git
COPY cmd /kubenav/cmd
COPY pkg /kubenav/pkg
COPY Makefile /kubenav
RUN export CGO_ENABLED=0 && make build-server

FROM alpine:3.15
RUN apk update && apk add --no-cache ca-certificates
RUN mkdir /kubenav
COPY --from=build /kubenav/build /kubenav/build
COPY --from=server /kubenav/bin/server /kubenav
WORKDIR /kubenav
USER nobody
ENTRYPOINT  [ "./server" ]
