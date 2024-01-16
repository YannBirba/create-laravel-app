#!/bin/bash

GREEN="\033[32m"

NC="\033[0m"
BOLD='\033[1m'

sudo cp ./create-laravel-app /usr/bin
sudo touch /var/log/create-laravel-app.log

sudo chmod +x /usr/bin/create-laravel-app

sudo chown "$USER" /var/log/create-laravel-app.log

sudo chmod +x ./uninstall.sh

if [[ -f ~/.zshrc ]]; then

    if [[ $(grep -c "alias cla" ~/.zshrc) -eq 0 ]]; then
        echo $'alias cla="source create-laravel-app"' >>~/.zshrc
    fi

    if [[ $(grep -c "alias create-laravel-app" ~/.zshrc) -eq 0 ]]; then
        echo $'alias create-laravel-app="source create-laravel-app"' >>~/.zshrc
    fi

    echo ""
    echo -e "${GREEN}${BOLD}↪ Install completed !${NC}"
    exec zsh

elif [[ -f ~/.bashrc ]]; then

    if [[ $(grep -c "alias cla" ~/.bashrc) -eq 0 ]]; then
        echo $'alias cla="source create-laravel-app"' >>~/.bashrc
    fi

    if [[ $(grep -c "alias create-laravel-app" ~/.bashrc) -eq 0 ]]; then
        echo $'alias create-laravel-app="source create-laravel-app"' >>~/.bashrc
    fi

    echo ""
    echo -e "${GREEN}${BOLD}↪ Install completed !${NC}"
    exec zsh
fi
