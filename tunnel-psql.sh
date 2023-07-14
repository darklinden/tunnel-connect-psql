#!/bin/bash

PIDS=$(ps aux | grep 'ssh -L' | grep -v grep | awk '{print $2}')
if [ -n "$PIDS" ]; then
    ps aux | grep 'ssh -L'

    echo "Killing ssh processes..."

    for PID in $PIDS; do
        echo "Killing ssh process: $PID"
        kill -9 $PID
    done
fi

echo "Starting ssh tunnel..."
ssh -L 5433:localhost:5432 -N -f psql-tunnel

echo "Connecting to database..."
psql --username=postgres --port=5433 --host=localhost --set=sslmode=prefer
