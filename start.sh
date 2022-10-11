#!/bin/bash

_term() { 
  echo "Caught SIGTERM signal!" 
  sleep 30
  kill -SIGQUIT "$child" 2>/dev/null
}

trap _term SIGTERM SIGQUIT EXIT

echo "Calling nginx through entrypoint...";
exec /docker-entrypoint.sh nginx -g 'daemon off;' &

child=$! 
wait "$child"
