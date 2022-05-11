FROM golang:1.18.2-alpine3.15 as build

WORKDIR /app
COPY ./codeeducation.go .
RUN go build codeeducation.go

FROM scratch
COPY --from=build /app/codeeducation .
CMD [ "./codeeducation" ]