#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# Replace USERNAME and PASSWORD with the appropriate credentials. Leave the quotes in place.
# Save the file.
# Once replaced and saved, in Terminal...
#    run: sh /path/to/this/file/2_retrieve_just_token.sh
#    
#    example: sh /Users/jonathan/Downloads/2_retrieve_just_token.sh

# Credentials
username="USERNAME"
password="PASSWORD"


################### DO NOT MODIFY BELOW THIS LINE ###################

# Command to retrieve the token and make it a variable. 
# Parse the response to grab just the token.
token=$(curl -s -u "$username":"$password" https://jnuc25api.jamfcloud.com/api/v1/auth/token -X POST | plutil -extract token raw - )

# Print/echo/display the token.
echo $token


# Investigate: I have a token, and it's a variable, now what?
# Investigate: I have saved credentials on my computer, in plain text, is this bad?