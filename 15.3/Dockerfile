FROM postgres:15.3
MAINTAINER Hermann Mayer "hermann.mayer@hausgold.de"

# You can change this environment variable on run's with -e
ENV MDNS_HOSTNAME=postgres.local
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres

# Install system packages
RUN apt-get update -yqqq && \
  apt-get install -y \
    dbus avahi-daemon avahi-utils libnss-mdns supervisor

# Copy custom scripts
COPY config/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

# Configure supervisord
COPY config/supervisor/* /etc/supervisor/conf.d/
RUN mkdir -p /var/log/supervisor

# Define the command to run per default
CMD /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
