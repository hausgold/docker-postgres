FROM postgres:17.5
LABEL org.opencontainers.image.authors="containers@hausgold.de"

# You can change this environment variable on run's with -e
ENV MDNS_HOSTNAME=postgres.local
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Install system certificates for verifications
RUN apt-get update -yqqq && apt-get install -y ca-certificates

# Configure extra postgres/debian archive repository
RUN echo 'deb [ signed-by=/usr/local/share/keyrings/postgres.gpg.asc ] \
  https://apt-archive.postgresql.org/pub/repos/apt trixie-pgdg-archive main' \
  >> /etc/apt/sources.list.d/pgdg.list

# Install system packages
RUN apt-get update -yqqq && \
  apt-cache policy postgresql-17-postgis-3 && \
  apt-get install -y \
    dbus avahi-daemon avahi-utils libnss-mdns supervisor \
    postgresql-17-postgis-3=3.6.0+dfsg-1.pgdg13+1

# Copy custom scripts
COPY config/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# Configure supervisord
COPY config/supervisor/* /etc/supervisor/conf.d/
RUN mkdir -p /var/log/supervisor

# Define the command to run per default
CMD ["/usr/bin/supervisord", "-nc", "/etc/supervisor/supervisord.conf"]
