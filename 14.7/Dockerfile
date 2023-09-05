FROM postgres:14.7
MAINTAINER Hermann Mayer "hermann.mayer@hausgold.de"

# You can change this environment variable on run's with -e
ENV MDNS_HOSTNAME=postgres.local
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Configure extra postgres/debian archive repository
RUN echo 'deb [ signed-by=/usr/local/share/keyrings/postgres.gpg.asc ] \
  https://apt-archive.postgresql.org/pub/repos/apt bullseye-pgdg-archive main' \
  >> /etc/apt/sources.list.d/pgdg.list

# Install system packages
RUN apt-get update -yqqq && \
  apt-cache policy postgresql-14-postgis-3 && \
  apt-get install -y \
    dbus avahi-daemon avahi-utils libnss-mdns supervisor \
    postgresql-14-postgis-3=3.4.0+dfsg-1.pgdg110+1

# Copy custom scripts
COPY config/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# Configure supervisord
COPY config/supervisor/* /etc/supervisor/conf.d/
RUN mkdir -p /var/log/supervisor

# Define the command to run per default
CMD /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
