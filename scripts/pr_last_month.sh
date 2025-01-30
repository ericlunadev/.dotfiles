#!/bin/bash

# Define the repositories
REPOS=("progistixworldwide/freightflow-web" "progistixworldwide/freightflow-demo")

# Calculate the first and last day of the previous month
START_DATE=$(date -v-1m -v1d +%Y-%m-01)
END_DATE=$(date -v1d -v+0m -v-1d +%Y-%m-%d)

# Loop through each repository and fetch PRs
for REPO in "${REPOS[@]}"; do
  echo "Pull Requests for repository: $REPO"
  gh pr list \
    --repo "$REPO" \
    --author "@me" \
    --state merged \
    --search "created:${START_DATE}..${END_DATE}" \
    --json number,title \
    --limit 100 | jq -r '.[] | "#\(.number): \(.title)"'
  echo "------------------------------"
done
