FROM debian:12.9-slim

ARG version
ENV VERSION=${version}

RUN apt-get update && apt-get install -y curl software-properties-common 

WORKDIR /app

RUN curl -fsSL https://github.com/bogdanfinn/tls-client-api/releases/download/v${VERSION}/tls-client-api-darwin-arm64-${VERSION} -o tls-client-api

RUN chmod +x tls-client-api

CMD ["/app/tls-client-api"]
