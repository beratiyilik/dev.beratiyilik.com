#!/bin/zsh
echo "EXECUTING deploy.sh FILE!";

echo "Working directory: $PWD";

echo "ls -la: $(ls -la)";

rsync -e "ssh -oStrictHostKeyChecking=no -v" -va --delete ./ $SERVER_USERNAME@$SERVER_HOSTNAME:/var/www/dev.beratiyilik.com --exclude '.circleci' --exclude '.git' --exclude '.gitignore'

ssh -oStrictHostKeyChecking=no -v $SERVER_USERNAME@$SERVER_HOSTNAME<<EOF
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