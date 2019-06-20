#!/bin/bash
### every exit != 0 fails the script
set -e
#set -u     # do not use

### Override user ID lookup to cope with being randomly assigned IDs using 'docker run --user x:y'.

USER_ID=$(id -u)
GROUP_ID=$(id -g)

### only in debug mode
if [ $DEBUG ] ; then
    echo "DEBUG: $0"
    id
    echo "DEBUG: ls -la /etc/passwd /etc/group"
    ls -la /etc/passwd /etc/group
fi

if [ x"$USER_ID" != x"0" -a x"$USER_ID" != x"1001" ] ; then

    ### add the new user into the group zero and rename the existing default application user to 'builder'
    cat /etc/passwd | sed -e 's/^headless:x:1001:0:Default:/builder:x:1001:0:Builder:/' > /tmp/passwd
    echo "headless:x:$USER_ID:0:Default:${HOME}:/bin/bash" >> /tmp/passwd
    cp /tmp/passwd /etc/
    rm /tmp/passwd

    ### add the new group if the same GID does not exist yet
    if [ $(grep -c -e ":x:$GROUP_ID:$" /etc/group) -eq 0 ] ; then
        echo "headless:x:$GROUP_ID:" >> /etc/group
    fi
fi
