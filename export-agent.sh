#!/usr/bin/env bash

curl --request POST \
  'https://dialogflow.googleapis.com/v2/projects/DialogFlow/agent:export?key=AIzaSyCMonpmMpFLdYNBKgwB0EQqvrQTHWj8qZs' \
  --header 'Authorization: Bearer ya29.c.b0Aa9VdylLWP05Zv-m4gQJIRtxEx50JYrkljJj8HTciUFrLXRDmTdOKWKr71IB7ASVlPXHc8MqZ8-HlcR2N95EJolhRUhuWHiCOJm_uSZmP8cuS0q-mUMefbyMdWQG0jsq29POmX70xVwdNy-9VQkAjDyk71xYpxTlW4NpDcCADBwWPqqdsUJ0O6SoGGSIgO9tKQ5vIvzln6218Az-DtZS8HCsTPT30g' \
  --header 'Accept: application/json' \
  --header 'Content-Type: application/json' \
  --data '{}' \
  --compressed
