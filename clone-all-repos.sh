#!/bin/bash

# Substitute variables here
ORG_NAME="<ORG NAME>"
ACCESS_TOKEN="<API KEY>"
GITHUB_INSTANCE="<GITHUB INSTANCE>

URL="https://${GITHUB_INSTANCE}/api/v3/orgs/${ORG_NAME}/repos?access_token=${ACCESS_TOKEN}"

curl ${URL} | ruby -rjson -e 'JSON.load(STDIN.read).each {|repo| %x[git clone #{repo["ssh_url"]} ]}'
