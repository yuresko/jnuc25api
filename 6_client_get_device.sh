#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# 1. Use the credentials created in 5_client_creds and fill in the credentials below
# 2. Ensure all values are filled in.
# 3. Save this file then, in Terminal...
#    run: sh /path/to/this/file/6_client_get_device.sh
#    
#    example: sh /Users/jonathan/Downloads/6_client_get_device.sh


# Credentials
client_id=""
client_secret=""
url=""
deviceId=""

################### DO NOT MODIFY BELOW THIS LINE ###################

# Command to retrieve the token and make it a variable. 
response=$(curl --silent --location --request POST "${url}/api/oauth/token" \
 	--header "Content-Type: application/x-www-form-urlencoded" \
	--data-urlencode "client_id=${client_id}" \
	--data-urlencode "grant_type=client_credentials" \
	--data-urlencode "client_secret=${client_secret}")

# Parse the response to grab just the token.
accessToken=$(echo "$response" | plutil -extract access_token raw -)

# Command to retrieve all computers using bearer token auth.
getResponse=$(curl -H "Authorization: Bearer $accessToken" $url/JSSResource/mobiledevices/id/$deviceId -X GET)

echo $getResponse
