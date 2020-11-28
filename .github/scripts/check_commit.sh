#!/bin/bash

pip install requests

echo $GITHUB_PR_COMMITS_URL
for sha in $(curl $GITHUB_PR_COMMITS_URL | jq '.[].sha' | sed 's/"//g')
do
  echo $sha
  python .github/scripts/custom_check_pull_request.py $sha
done

