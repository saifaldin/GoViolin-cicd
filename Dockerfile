FROM golang:1.13.8-alpine
COPY . .
RUN go get -d ./... 
RUN go build -o goviolinapp
CMD ["./goviolinapp"]