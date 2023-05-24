#!/bin/bash
set -e
eval "$(jq -r '@sh "LAMBDA_NAME=\(.lambda_name)"')"

zip -q -j ../terraform/lambda.zip ../lambdas/${LAMBDA_NAME}/index.js

jq -n '{file_name:"lambda.zip"}'