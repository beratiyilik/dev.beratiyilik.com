#!/bin/zsh
# emulate -LR zsh # reset zsh options
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin

echo "DEPLOY HAS STARTED!";

echo "LOCAL USER: $(whoami)" # print the user name

echo "LOCAL WORKING DIRECTORY: $(pwd)" # print the current directory

echo "LOCAL PATH: ${PATH}" # print the path

rsync -va --delete ./ root@ssh.beratiyilik.com:/var/www/dev.beratiyilik.com --exclude={"build",".git",".gitignore","node_modules",".circleci","deploy.sh"}  # deploy the project

ssh root@ssh.beratiyilik.com<<EOF
    cd /var/www/dev.beratiyilik.com;
    npm install && npm run build;
    pm2 restart APP_TEST;
    systemctl restart nginx;
    pm2 show APP_TEST;
    systemctl status nginx;
    logout;
EOF

curl -I https://dev.beratiyilik.com/

echo "DEPLOY HAS FINISHED!";

## eof