FROM alpine
RUN apk add --no-cache bash
COPY ./simple.sh /
ENTRYPOINT ["/simple.sh"]
