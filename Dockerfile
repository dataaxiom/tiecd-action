FROM docker:20.10

RUN apk add bash

RUN set

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
