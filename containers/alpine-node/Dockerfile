FROM alpine:edge

RUN apk add --no-cache \
    nodejs \
    npm \
    curl \
  && curl -L https://raw.githubusercontent.com/pnpm/self-installer/master/install.js | node \
  && apk del curl

COPY specs.sh /usr/local/bin/
