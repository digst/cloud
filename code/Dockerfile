FROM golang:latest
WORKDIR /go/src/app
COPY ForTheBirds.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
WORKDIR /root/
COPY --from=0 /go/src/app .
CMD ["./app"]  
