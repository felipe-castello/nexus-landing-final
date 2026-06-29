#!/usr/bin/env bash
set -e
APP_DIR="/var/www/nexusiotenergy"
CONF_SRC="nginx-nexusiotenergy.conf"
CONF_DST="/etc/nginx/sites-available/nexusiotenergy"

sudo mkdir -p "$APP_DIR"
sudo rsync -av --delete ./ "$APP_DIR" --exclude deploy.sh --exclude nginx-nexusiotenergy.conf --exclude README_DEPLOY.md
sudo chown -R www-data:www-data "$APP_DIR"
sudo chmod -R 755 "$APP_DIR"

sudo cp "$CONF_SRC" "$CONF_DST"
sudo ln -sf "$CONF_DST" /etc/nginx/sites-enabled/nexusiotenergy
sudo nginx -t
sudo systemctl reload nginx

echo "Deploy concluído: http://www.nexusiotenergy.com.br"
echo "Para SSL: sudo certbot --nginx -d nexusiotenergy.com.br -d www.nexusiotenergy.com.br"
