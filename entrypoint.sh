#!/bin/bash
cd /home/container
sleep 1
# Make internal Docker IP address available to processes.
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Update SRCDS 2013
./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container +app_update 244310 +quit

# Update TF2 DS
./steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/container/tf2ds +app_update 232250 +quit

if [ ! -z ${AUTO_CHECKOUT} ]; then
    echo "[SVN] Checking out for commits"
    svn co --username ${SVN_USER} --password ${SVN_PASSWORD} --non-interactive --trust-server-cert ${SVN_REPO} open_fortress
    svn cleanup open_fortress
fi

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
