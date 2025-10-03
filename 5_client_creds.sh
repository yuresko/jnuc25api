#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# 1. In Jamf Pro, navigate to Settings -> API Roles and Clients
# 2. Create a new role by clicking the + sign
# 3. Give it a name that makes sense for the permissions, and appropriate permissions
#    For example:
#    Name - Update Mobile Devices
#    Permissions - Read Mobile Devices, Update Mobile Devices, Update Users
# (Note: permissions can be found: https://developer.jamf.com/jamf-pro/docs/classic-api-minimum-required-privileges-and-endpoint-mapping)
# 4. Save the role
# 5. Navigate back to API Roles and Clients and select API Clients
# 6. Create a new client with an appropriate name that matches the role, select the role, enable client, then save.
# 7. Click "Generate Client Secret" and add the id and secret below. Note any trailing spaces or enters.
# 8. Save this file then, in Terminal...
#    run: sh /path/to/this/file/5_client_creds.sh
#    
#    example: sh /Users/jonathan/Downloads/5_client_creds.sh


# Credentials
client_id=""
client_secret=""
url=""

# Command to retrieve the token and make it a variable. 
# Parse the response to grab just the token.
response=$(curl --silent --location --request POST "${url}/api/oauth/token" \
 	--header "Content-Type: application/x-www-form-urlencoded" \
	--data-urlencode "client_id=${client_id}" \
	--data-urlencode "grant_type=client_credentials" \
	--data-urlencode "client_secret=${client_secret}")

# Parse the response to grab just the token and make it a variable..
accessToken=$(echo "$response" | plutil -extract access_token raw -)

# Print/echo/display the token.
echo $accessToken

# Investigate: This token looks familiar...hmmmm.

