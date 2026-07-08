JIRA_BASE_URL="https://somatus.atlassian.net"
JIRA_PROJECT_KEY="IN"
JIRA_VERSION_NAME="demo"
JIRA_EMAIL="jira-automation@yourcompany.com"
JIRA_API_TOKEN="your-token"

JIRA_BASE_URL="https://nachochukwu.atlassian.net"
JIRA_PROJECT_KEY="DEVOPS"
JIRA_VERSION_NAME=demo
JIRA_EMAIL="nacho.chukwu@gmail.com"
JIRA_API_TOKEN="ATATT3xFfGF0De0og-LZJj6NrDOH_iXB7eOpA6i802l-J6YfzhNGd7ut7Hi3Cm6MiuXefOpEmwGsZX6HBx2SmEkYG0b2zHIR89JokiQBhUDmf88MmQOTPHCyyzW3xV3MjhysTnRxl7MNjD8pVxcjHTAcWH5jwS5zwNLJsZmC376a7FksDzR3Pjc=05AC427A"


AUTH=$(echo -n "$JIRA_EMAIL:$JIRA_API_TOKEN" | base64)

VERSION_ID=$(curl -s \
  -H "Authorization: Basic $AUTH" \
  -H "Accept: application/json" \
  "$JIRA_BASE_URL/rest/api/3/project/$JIRA_PROJECT_KEY/versions" \
  | jq -r ".[] | select(.name==\"$JIRA_VERSION_NAME\") | .id")

echo $VERSION_ID

curl -s -X PUT \
  -H "Authorization: Basic $AUTH" \
  -H "Content-Type: application/json" \
  "$JIRA_BASE_URL/rest/api/3/version/$VERSION_ID" \
  --data "{
    \"released\": true,
    \"releaseDate\": \"$(date +%F)\"
  }"

######


VERSION_ID=10000

curl -s \
  -u "$JIRA_EMAIL:$JIRA_API_TOKEN" \
  -X PUT \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  "$JIRA_BASE_URL/rest/api/3/version/$VERSION_ID" \
  -d "{
    \"released\": true,
    \"releaseDate\": \"$(date +%F)\"
  }"