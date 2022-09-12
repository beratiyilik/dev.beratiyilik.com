#!/bin/zsh
# emulate -LR zsh # reset zsh options
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin

echo "DEPLOY HAS STARTED!";

echo "LOCAL USER: $(whoami)" # print the user name

echo "LOCAL WORKING DIRECTORY: $(pwd)" # print the current directory

echo "LOCAL PATH: ${PATH}" # print the path

ssh root@ssh.beratiyilik.com "cd /var/www/dev.beratiyilik.com && rm -rf build node_modules"

rsync -va --delete ./ root@ssh.beratiyilik.com:/var/www/dev.beratiyilik.com --exclude={".circleci",".git",".gitignore","build","node_modules"}  # deploy the project

ssh root@ssh.beratiyilik.com<<EOF
    cd /var/www/dev.beratiyilik.com;
    rm -rf build node_modules;
    npm install && npm run build;
    pm2 restart APP_TEST && systemctl restart nginx;
    pm2 show APP_TEST;
    systemctl status nginx;
    logout;
EOF

curl -I https://dev.beratiyilik.com/

echo "DEPLOY HAS FINISHED!";

## eof