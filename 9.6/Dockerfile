FROM postgres:9.6
MAINTAINER Hermann Mayer "hermann.mayer@hausgold.de"

# You can change this environment variable on run's with -e
ENV MDNS_HOSTNAME=postgres.local

# Install system packages
RUN apt-get update -yqqq && \
  apt-get install -y \
    dbus avahi-daemon avahi-utils libnss-mdns supervisor

# Copy avahi.sh
COPY config/avahi.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/avahi.sh

# Configure supervisord
COPY config/supervisor/* /etc/supervisor/conf.d/

# Define the command to run per default
CMD /usr/bin/supervisord -nc /etc/supervisor/supervisord.conf
