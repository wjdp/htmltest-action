ARG HTMLTEST_VERSION=0.14.0-rc1
FROM wjdp/htmltest:v${HTMLTEST_VERSION}

RUN apk add bash

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
