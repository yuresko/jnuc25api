#!/bin/bash

##################
## INSTRUCTIONS ##
##################
# 1. Fill in the appropriate credentials. Leave the quotes in place.
# 2. Ensure all values are filled in.
# 3. Save this file then, in Terminal...
#    run: sh /path/to/this/file/7_update_device_username.sh
#    
#    example: sh /Users/jonathan/Downloads/7_update_device_username.sh


# Credentials
username=""
password=""
url=""
deviceId=""
deviceOwnerUsername=""

# Command to retrieve the token and make it a variable. 
bearerToken=$(curl -s -u "$username":"$password" "$url"/api/v1/auth/token -X POST | plutil -extract token raw - )

# Command to retrieve the token and make it a variable. 
response=$(curl -H "Authorization: Bearer $bearerToken" \
	-H "Content-Type: application/xml" \
	"$url/JSSResource/mobiledevices/id/$deviceId" \
	--data "<mobile_device><username>$deviceOwnerUsername</username></mobile_device>" \
	-X PUT)

# Did it work?
echo $response

# The long command on multiple lines can also be writtin as one line such as:
# curl -H "Authorization: Bearer $bearerToken" -H "Content-Type: application/xml" "$url/JSSResource/mobiledevices/id/$deviceId" --data "<mobile_device><username>$deviceOwnerUsername</username></mobile_device>" -X PUT