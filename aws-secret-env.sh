#!/bin/bash
echo "$1"
secret=$(aws secretsmanager get-secret-value --secret-id "$1" --query SecretString --output text)
json=$(echo $secret | jq -rc)

# https://stackoverflow.com/questions/48512914/exporting-json-to-environment-variables
while read -rd $'' line
do
    export "$line"
done < <(jq -r <<<"$json" \
         'to_entries|map("\(.key)=\(.value)\u0000")[]')

