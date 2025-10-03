#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# 1. Fill in the appropriate credentials. Leave the quotes in place.
# 2. Save the file.
# 3. Once credentials are filled in and saved, in Terminal...
#    run: sh /path/to/this/file/4_get_computers_xml.sh
#    
#    example: sh /Users/jonathan/Downloads/4_get_computers_xml.sh

# Credentials
username=""
password=""
url=""

# Command to retrieve the token and make it a variable. 
# Parse the response to grab just the token.
bearerToken=$(curl -s -u "$username":"$password" "$url"/api/v1/auth/token -X POST | plutil -extract token raw - )

# Print/echo/display the token.
echo $bearerToken

# Command to retrieve all computers using bearer token auth. Data type: XML.
curl -s -H "Authorization: Bearer ${bearerToken}" -H "accept: application/xml" "$url"/JSSResource/computers -X GET

# Investigate: Woah that's a lot of data.
# Investigate: Using https://jnuc25api.jamfcloud.com/api and clicking classic API,
#   what if I swap out "computers" for something else?