#!/bin/bash
zip -q -j ../terraform/lambda.zip ../lambda/index.js

jq -n '{file_name:"lambda.zip"}'