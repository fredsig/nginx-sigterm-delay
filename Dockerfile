FROM nginxinc/nginx-unprivileged:1.24-alpine

USER root
RUN apk add --no-cache bash
COPY ./start.sh /start.sh

ENTRYPOINT ["/start.sh"]
