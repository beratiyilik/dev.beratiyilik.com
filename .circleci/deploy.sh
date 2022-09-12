#!/bin/bash
echo "EXECUTING deploy.sh FILE!";

echo "Working directory: $PWD";

echo "ls -la: $(ls -la)";

echo "ENVIRONMENT VARIABLES: $BASH_ENV";

rsync -e "ssh -oStrictHostKeyChecking=no -v" -va --delete ./ $VPS_USERNAME@$VPS_HOSTNAME:/var/www/dev.beratiyilik.com --exclude '.circleci' --exclude '.git' --exclude '.gitignore' --exclude 'build' --exclude 'node_modules'

ssh -oStrictHostKeyChecking=no -v $VPS_USERNAME@$VPS_HOSTNAME<<EOF
    cd /var/www/dev.beratiyilik.com;
    rm -rf build node_modules;
    npm install && npm run build;
    pm2 restart APP_TEST && systemctl restart nginx;
    pm2 show APP_TEST;
    systemctl status nginx;
    logout;
EOF


echo "END OF deploy.sh FILE!";

## eof