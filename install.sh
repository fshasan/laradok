#!/bin/bash

#if already have docker-compose.yml and .env, then skip copy from example 
if [ -f "docker-compose.yml" ]; then
    echo "docker-compose.yml already exists"
else
    echo "Coping docker-compose.yml.example to docker-compose.yml"
    cp docker-compose.yml.example docker-compose.yml
fi

read -p "Do you want to review the docker file? y/n: " CHOICE
if [[ $CHOICE == "y" ]]; then
	nano docker-compose.yml
fi

if [ -f ".env" ]; then
    echo ".env already exists"
else
    echo "Coping .env.example to .env"
    cp .env.example .env
fi

read -p "Do you want to review the env file? y/n: " CHOICE
if [[ $CHOICE == "y" ]]; then
	nano .env
fi

#### Clone your laravel repo and write down the command here ####

git clone
cp app/.env.example app/.env

#docker 
#up containers
echo "Starting containers"
docker-compose up -d

#laravel app permissions
echo "Setting laravel app permissions"
sudo chmod -R 775 app/storage
sudo chmod -R 775 app/bootstrap/cache

#laravel dependencies
echo "Installing laravel dependencies"
docker-compose exec laradok_worker composer install --prefer-source 
echo "Generating laravel key"
docker-compose exec laradok_app php artisan key:generate 

#up containers
echo "Re-start containers"
docker-compose restart
