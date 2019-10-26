#!/bin/bash
cd /home/container

# Print information
echo "Running on Alpine $(cat /etc/alpine-release)"
echo "Current timezone is: $(cat /etc/timezone)"
java -version

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
