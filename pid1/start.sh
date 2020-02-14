#!/bin/bash

echo "Starting nginx ..."

# daemon off is used for nginx to start in foreground and block until terminated
nginx -g 'daemon off;'
