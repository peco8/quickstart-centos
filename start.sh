#!/bin/bash

# Set up AUTHORIZED_KEY if you specify the one
if [ "$AUTHORIZED_KEY" != "none" ]; then
    mkdir -p /root/.ssh
    chmod 600 /root/.ssh
    touch /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/authorized_keys
    echo "$AUTHORIZED_KEY" >> /root/.ssh/authorized_keys

    # Configure sshd.conf
    ## For pubkey authentication
    sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
fi

if [ "$ROOT_PWD" == "default" ]; then
  ROOT_PWD="root"
fi
echo "root:$ROOT_PWD" | chpasswd

/usr/sbin/sshd -D
