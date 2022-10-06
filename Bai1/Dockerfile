# syntax=docker/dockerfile:1

# Alpine is chosen for its small footprint
# compared to Ubuntu
FROM golang:1.16-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main app.go

FROM alpine:3.13
WORKDIR /app
COPY --from=builder /app/main .
CMD [ "/app/main" ]

# ... the rest of the Dockerfile is ...
# ...   omitted from this example   ...