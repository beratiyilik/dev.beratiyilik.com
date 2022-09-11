#!/bin/zsh
echo "Executing deploy.sh"
whoami
pwd
ls -a

echo yes | ssh $SERVER_USERNAME@$SERVER_HOSTNAME "whoami && pwd"