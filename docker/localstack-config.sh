#!/bin/bash
set -eo pipefail

# Run the main entrypoint script in background mode
docker-entrypoint.sh &

sleep 5000

# Change YOUR_EMAIL_HERE to the email you want to verify
echo 'Running AWS verify identity command. See: https://github.com/localstack/localstack/issues/339'
aws ses verify-email-identity --email-address no-reply@golsfamilia.com --region us-west-2 --endpoint-url=http://localhost:4566

# Keeps the container running, otherwise will take the exit code from the `aws` command and stop the container
while :; do :; done & kill -STOP $! && wait $!