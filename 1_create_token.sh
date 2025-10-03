#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# Replace USERNAME and PASSWORD with the appropriate credentials. Leave the quotes in place.
# Once replaced, copy and paste the whole line into Terminal, and hit Enter/Return.

curl -s -u "USERNAME":"PASSWORD" https://jnuc25api.jamfcloud.com/api/v1/auth/token -X POST

# Investigate what you receive back as a response.