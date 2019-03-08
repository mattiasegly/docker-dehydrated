FROM balenalib/rpi:buster

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	curl \
	openssl \
	libxml2-utils \
&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN [ "cross-build-end" ]

VOLUME /letsencrypt

ENTRYPOINT ["entrypoint.sh"]
CMD ["/dehydrated/dehydrated", "-c", "--accept-terms"]
