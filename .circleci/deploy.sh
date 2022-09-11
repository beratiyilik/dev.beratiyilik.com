#!/bin/zsh
echo "Executing deploy.sh"
whoami
pwd
ls -a
ssh -oStrictHostKeyChecking=no -v $SERVER_USERNAME@$SERVER_HOSTNAME "whoami && pwd"