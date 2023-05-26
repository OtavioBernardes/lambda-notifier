#!/bin/bash
set -e
eval "$(jq -r '@sh "LAMBDA_NAME=\(.lambda_name)"')"

cd ../lambdas/${LAMBDA_NAME}

npm i --silent
zip -r -q ../../terraform/${LAMBDA_NAME}.zip .

jq -n --arg lambda ${LAMBDA_NAME} '{file_name:"\($lambda).zip"}'