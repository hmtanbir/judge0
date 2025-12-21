FROM hmtanbir/compilers:0.0.3 AS production

# ----------------------------------------------------
# Metadata
# ----------------------------------------------------
ENV JUDGE0_HOMEPAGE "https://judge0.com"
LABEL homepage=$JUDGE0_HOMEPAGE

ENV JUDGE0_SOURCE_CODE "https://github.com/hmtanbir/judge0"
LABEL source_code=$JUDGE0_SOURCE_CODE

ENV JUDGE0_MAINTAINER "Herman Zvonimir Došilović <hermanz.dosilovic@gmail.com>"
LABEL maintainer=$JUDGE0_MAINTAINER

ENV JUDGE0_VERSION "1.13.1"
LABEL version=$JUDGE0_VERSION

# ----------------------------------------------------
# Paths
# ----------------------------------------------------
ENV PATH="/usr/local/bin:/opt/.gem/bin:$PATH"
ENV GEM_HOME="/opt/.gem/"

# ----------------------------------------------------
# System dependencies + isolate build deps
# ----------------------------------------------------
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      cron \
      sudo \
      libpq-dev \
      build-essential \
      pkg-config \
      libcap-dev \
      git \
      ca-certificates \
      libsystemd-dev \
      systemd \
      asciidoc \
      libxml2-utils \
    && rm -rf /var/lib/apt/lists/*



# ----------------------------------------------------
# Install isolate
# ----------------------------------------------------
RUN git clone https://github.com/ioi/isolate.git /tmp/isolate && \
    cd /tmp/isolate && \
    sed -i '/isolate\.1/d' Makefile && \
    make && \
    make install && \
    cd / && \
    rm -rf /tmp/isolate


# ----------------------------------------------------
# Ruby & Node tooling
# ----------------------------------------------------
RUN echo "gem: --no-document" > /root/.gemrc && \
    gem install bundler && \
    npm install -g --unsafe-perm aglio@2.3.0

# ----------------------------------------------------
# App setup
# ----------------------------------------------------
EXPOSE 2358
WORKDIR /api

COPY Gemfile* ./
RUN RAILS_ENV=production bundle install --jobs 4 --retry 3

COPY cron /etc/cron.d
RUN cat /etc/cron.d/* | crontab -

COPY . .

# ----------------------------------------------------
# User setup
# ----------------------------------------------------
RUN useradd -u 1000 -m -r judge0 && \
    echo "judge0 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chown judge0: /api/tmp/

USER judge0

# ----------------------------------------------------
# Box setup
# ----------------------------------------------------
RUN mkdir -p /box && chown -R judge0:judge0 /box

# ----------------------------------------------------
# Entrypoint
# ----------------------------------------------------
ENTRYPOINT ["/api/docker-entrypoint.sh"]
CMD ["/api/scripts/server"]

# ----------------------------------------------------
# Development stage
# ----------------------------------------------------
FROM production AS development
CMD ["sleep", "infinity"]
