FROM golang:1.9 as builder
WORKDIR /go/src/github.com/mnuttall/simple
COPY . .
RUN go build . 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM golang:1.9
COPY --from=builder /go/src/github.com/mnuttall/simple/app /app
ENTRYPOINT ["/app"]

