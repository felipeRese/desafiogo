FROM golang:1.18-alpine AS build

WORKDIR /app

COPY ./index.go .

RUN go build -o index index.go

FROM scratch

COPY --from=build /app/index /

CMD ["./index"]
