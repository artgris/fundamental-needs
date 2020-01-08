#!/bin/bash

. functions.sh

res=$(asking_to_install "Install apache2?")
echo $res

if [[ $res ]]; then
  echo "Installing..."

  sudo apt install apache2
  sudo a2enmod vhost_alias
  sudo a2enmod rewrite

  sudo ufw app list
  sudo ufw allow 'Apache'
  sudo ufw status

  sudo systemctl restart apache2

else
  echo "NEXT"
fi