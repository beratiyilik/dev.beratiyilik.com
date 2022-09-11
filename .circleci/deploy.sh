#!/bin/zsh
echo "EXECUTING deploy.sh FILE!";

echo "Working directory: $PWD";

echo "ls -la: $(ls -la)";

#ssh -oStrictHostKeyChecking=no -v $SERVER_USERNAME@$SERVER_HOSTNAME "cd /var/www/dev.beratiyilik.com && rm -rf build node_modules"

#rsync -e "ssh -oStrictHostKeyChecking=no -v" -va --delete ./ $SERVER_USERNAME@$SERVER_HOSTNAME:/var/www/dev.beratiyilik.com --exclude '.circleci' --exclude '.git' --exclude '.gitignore' --exclude 'build' --exclude 'node_modules'

#ssh -oStrictHostKeyChecking=no -v $SERVER_USERNAME@$SERVER_HOSTNAME<<EOF
#    cd /var/www/dev.beratiyilik.com;
#    npm install && npm run build;
#    pm2 restart APP_TEST && systemctl restart nginx;
#    pm2 show APP_TEST;
#    systemctl status nginx;
#    logout;
#EOF


echo "ls -la project: $(ls -la project)";


echo "END OF deploy.sh FILE!";

## eof