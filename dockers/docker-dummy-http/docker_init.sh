#!/usr/bin/env bash

# Ensure directories exist
mkdir -p /etc/supervisor/conf.d/

# Make service executable just in case
chmod +x /usr/bin/hello-sonic-service

# Hand off to supervisord
exec /usr/local/bin/supervisord