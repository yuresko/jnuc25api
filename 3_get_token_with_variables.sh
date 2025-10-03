#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# 1. Fill in the appropriate credentials. Leave the quotes in place.
# 2. Save the file.
# 3. Once credentials are filled in and saved, in Terminal...
#    run: sh /path/to/this/file/3_get_token_with_variables.sh
#    
#    example: sh /Users/jonathan/Downloads/3_get_token_with_variables.sh

# Credentials
username=""
password=""
url=""

################### DO NOT MODIFY BELOW THIS LINE ###################

# Command to retrieve the token and make it a variable. 
# Parse the response to grab just the token.
response=$(curl -s -u "$username":"$password" "$url"/api/v1/auth/token -X POST | plutil -extract token raw - )

# Print/echo/display the token.
echo $response

# Investigate: I have a token, and it's a variable, now what?
# Investigate: Why would I variablize the url? 