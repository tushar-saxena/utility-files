#!/bin/bash
echo $1
curl -X POST https://api.clickup.com/api/v1/list/3016976/task -H 'Authorization: pk_ZA9C3ZU70BIWRIONCACYHHKMCEOFGWMM'   -H 'Content-Type: application/json'   -H 'Postman-Token: eadb6c3f-50af-4d5f-8683-afe937d9bf09'   -H 'cache-control: no-cache'   -d "{
  \"name\": \"$1\",
  \"assignees\": [
    89976
  ],
  \"status\": \"Open\",
  \"priority\": 3
}"
