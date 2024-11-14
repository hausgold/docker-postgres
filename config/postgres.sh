#!/usr/bin/env bash

# Enable logical replication by default. This allows tools like Debezium
# directly to add an replication slot to stream events.
export POSTGRES_ARGS=${POSTGRES_ARGS:-'-c wal_level=logical'}

exec /usr/local/bin/docker-entrypoint.sh postgres ${POSTGRES_ARGS}
