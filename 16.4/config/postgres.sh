#!/usr/bin/env bash

export POSTGRES_ARGS=${POSTGRES_ARGS:-''}

exec /usr/local/bin/docker-entrypoint.sh postgres ${POSTGRES_ARGS}
