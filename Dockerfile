FROM ruby:2.2-onbuild

ENV PHANTOM_JS_VERSION 1.9.8

# Install phantomjs in /usr/local/bin
RUN set -x; \
	curl -o /tmp/phantomjs.tar.bz2 -SL "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOM_JS_VERSION}-linux-x86_64.tar.bz2" \
	&& mkdir /tmp/phantomjs \
	&& tar -xf /tmp/phantomjs.tar.bz2 -C /tmp/phantomjs --strip-components=1 \
	&& mv /tmp/phantomjs/bin/phantomjs /usr/local/bin/ \
	&& rm -rf /tmp/phantomjs* \
	&& phantomjs --version

RUN set -x; apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s"]
