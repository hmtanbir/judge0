#!/bin/bash
# Ensure sandbox exists and is writable
mkdir -p /box
chown -R judge0:judge0 /box

sudo cron
exec "$@"
