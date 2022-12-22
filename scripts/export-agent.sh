#!/usr/bin/env bash

curl --request POST \
  'https://dialogflow.googleapis.com/v2/projects/DialogFlow/agent:export?key=*********' \
  --header 'Authorization: Bearer *********g' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{}' \
  --compressed
