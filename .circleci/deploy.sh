#!/bin/zsh
echo "Executing deploy.sh"
whoami
pwd
ls -a
ssh $SERVER_USERNAME@$SERVER_HOSTNAME "whoami && pwd"