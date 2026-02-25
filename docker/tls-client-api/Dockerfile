# rqeuired in .tool-versions
FROM golang:1.25.5-bookworm AS base

ARG hash

ENV hash=${hash}

RUN apt-get update && apt-get install -y git

FROM base AS deps

WORKDIR /app

# the history on this repo is MASSIVE
RUN git clone --depth 1 https://github.com/bogdanfinn/tls-client-api.git tls-client-api \
  && cd tls-client-api && git checkout ${hash}

# RUN git clone https://github.com/Solem8s/gosoline gasoline \
#   && cd gasoline && git branch tls-client-api

WORKDIR /app/tls-client-api

# only needed for windows
RUN sed -i '/replace github.com\/justtrackio\/gosoline/d' /app/tls-client-api/go.mod

RUN go mod tidy && go mod download

FROM deps AS builder

RUN GOOS=linux GOARCH=arm64 go build -o out ./cmd/tls-client-api/main.go

FROM debian:13.3-slim

WORKDIR /app

RUN apt-get update && apt-get install -y ca-certificates

COPY --from=builder /app/tls-client-api/out /app/tls-client-api

RUN chmod +x /app/tls-client-api

CMD ["/app/tls-client-api"]
