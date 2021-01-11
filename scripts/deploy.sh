#!/bin/bash

PATH_ORIGIN="/home/ubuntu/site-al_coworking"
PATH_DEPLOY=""
ENV=""
FILE="/home/ubuntu/log.txt";

if [ "$DEPLOYMENT_GROUP_NAME" == "site-production" ]; then
    PATH_DEPLOY="/var/www/html/andrezacoworking.com.br"
    ENV="/home/ubuntu/env-site-al_coworking-prod";
fi
if [ "$DEPLOYMENT_GROUP_NAME" == "site-development" ]; then
    PATH_DEPLOY="/var/www/html/site.andrezacoworking.com.br"
    ENV="/home/ubuntu/env-site-al_coworking-dev";
fi

cp -Rp $ENV "$PATH_ORIGIN/.env"
cp -Rp "$PATH_ORIGIN"/* $PATH_DEPLOY

cd $PATH_DEPLOY

composer install

cd public

npm install