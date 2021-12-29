ARG HTMLTEST_VERSION=0.15.0
FROM wjdp/htmltest:v${HTMLTEST_VERSION}

RUN apk add bash

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
