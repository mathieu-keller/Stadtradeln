FROM alpine:3.18.3

RUN addgroup -S 10001 && adduser -S 10001 -G 10001
USER 10001:10001

WORKDIR /home/notifier/bin/
COPY --chown=10001:10001 target/x86_64-unknown-linux-musl/release/stadtradeln .
CMD ["./stadtradeln"]

