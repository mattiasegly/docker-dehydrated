ARG ARCH=
ARG SOURCE_BRANCH=
FROM mattiasegly/base-image:${SOURCE_BRANCH}-${ARCH} AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/dehydrated-io/dehydrated.git /dehydrated && \
	git clone https://github.com/gheja/dns-01-manual.git /dehydrated/hooks/manual && \
	chmod +x /dehydrated/hooks/manual/hook.sh

FROM mattiasegly/base-image:${SOURCE_BRANCH}-${ARCH}

RUN apt-get update && apt-get install -y --no-install-recommends \
	libxml2-utils \
	bsdmainutils \
&& rm -rf /var/lib/apt/lists/*

COPY --from=builder /dehydrated /dehydrated
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

VOLUME /letsencrypt

ENTRYPOINT ["entrypoint.sh"]
CMD ["/dehydrated/dehydrated", "--cron", "--accept-terms", "--force"]
