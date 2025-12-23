#!/bin/bash

mkdir -p /run/isolate/cgroup
mount -t cgroup none /run/isolate/cgroup

sudo cron
exec "$@"
