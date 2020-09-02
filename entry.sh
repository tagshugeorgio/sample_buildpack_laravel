#!/bin/bash
echo $ENV_SECRETS | tr ' ' '\n' > .env;
php artisan cache:clear;
php artisan config:clear;
php artisan view:clear;
$(composer config bin-dir)/heroku-php-nginx -C nginx_app.conf public/;