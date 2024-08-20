#Build
FROM golang:1.19 as Build

WORKDIR /app

COPY main.go .

RUN go build main.go

#Run
FROM scratch

WORKDIR /app 

COPY --from=Build /app/main .

ENTRYPOINT ["./main"]

