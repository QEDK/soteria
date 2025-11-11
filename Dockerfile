FROM rust:slim AS builder

WORKDIR /app

COPY . .

RUN cargo build --profile release --bin soteria

FROM gcr.io/distroless/cc-debian12:nonroot AS runtime

WORKDIR /data

COPY --from=builder /app/target/release/soteria /usr/local/bin/soteria

USER 65532:65532

ENTRYPOINT ["/usr/local/bin/soteria"]
