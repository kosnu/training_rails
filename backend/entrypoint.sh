#!/bin/bash

set -e

rm -f /rails_docker/tmp/pids/server.pid

exec $@
