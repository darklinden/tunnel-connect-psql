#!/bin/bash

PIDS=$(ps aux | grep 'ssh -L' | grep -v grep | awk '{print $2}')
if [ -n "$PIDS" ]; then
    ps aux | grep 'ssh -L'

    echo "Killing ssh processes..."

    for PID in $PIDS; do
        echo "Killing ssh process: $PID"
        kill -9 $PID
    done
else
    echo "No ssh processes found."
fi
