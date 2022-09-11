#!/bin/zsh
echo "Executing deploy.sh"

ssh -oStrictHostKeyChecking=no -v $SERVER_USERNAME@$SERVER_HOSTNAME<<EOF
    pwd;
    whoami;
    logout;
EOF