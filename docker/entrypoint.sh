#!/bin/sh

set -e

if [ -f myapp/tmp/pids/server.pid ]; then
  rm myapp/tmp/pids/server.pid
fi

bundle install

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"