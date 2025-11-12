FROM rust:alpine AS builder

WORKDIR /app

RUN apk add --no-cache musl-dev

COPY . .

RUN cargo build --profile release --bin soteria

FROM gcr.io/distroless/static-debian12:nonroot AS runtime

WORKDIR /data

COPY --from=builder /app/target/release/soteria /usr/local/bin/soteria

USER 65532:65532

ENTRYPOINT ["/usr/local/bin/soteria"]

LABEL name="soteria"
LABEL description="A simple CLI tool for validating Safe transaction hashes from JSON log files"
LABEL org.opencontainers.image.title="soteria"
LABEL org.opencontainers.image.description="A simple CLI tool for validating Safe transaction hashes from JSON log files"
LABEL org.opencontainers.image.authors="QEDK <qedk@monad.foundation>"
LABEL org.opencontainers.image.vendor="Monad Foundation"
LABEL org.opencontainers.image.licenses="Apache-2.0"
LABEL org.opencontainers.image.source="https://github.com/monad-developers/soteria"
LABEL org.opencontainers.image.documentation="https://github.com/monad-developers/soteria/README.md"
