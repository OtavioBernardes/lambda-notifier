#!/bin/bash
set -e
eval "$(jq -r '@sh "LAMBDA_NAME=\(.lambda_name)"')"

cd ../lambdas/${LAMBDA_NAME}

npm i --silent
zip -r -q ../../terraform/lambda.zip .

jq -n '{file_name:"lambda.zip"}'