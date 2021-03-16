#!/bin/bash

if [ ! -f "$USER_FILE" ]; then
  echo "No auth file found. Generating";
  DIR=$(dirname $USER_FILE)
  mkdir -p $DIR
  htpasswd -bB -c $USER_FILE $USER $PASSWORD;
  echo "Done";
fi

echo "Starting Server";
python -u -m radicale;