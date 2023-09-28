FROM alpine:3.18.4

RUN addgroup -S 10001 && adduser -S 10001 -G 10001
USER 10001:10001

WORKDIR /home/notifier/bin/
COPY --chown=10001:10001 target/x86_64-unknown-linux-musl/release/stadtradeln .
EXPOSE 8080
CMD ["./stadtradeln"]

