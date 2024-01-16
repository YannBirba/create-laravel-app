#!/bin/bash

GREEN="\033[32m"
YELLOW="\033[33m"

NC="\033[0m"
BOLD='\033[1m'

if sudo rm /usr/bin/create-laravel-app; then
    echo ""
    echo -e "${BOLD}↪ create-laravel-app succesfully deleted from /usr/bin !${NC}"

else
    echo ""
    echo -e "${YELLOW}${BOLD}↪ Skipped ! File is maybe not existing.${NC}"
    echo ""
fi

if sudo rm /var/log/create-laravel-app.log; then
    echo ""
    echo -e "${BOLD}↪ create-laravel-app.log succesfully deleted from /var/log !${NC}"
    echo ""
else
    echo ""
    echo -e "${YELLOW}${BOLD}↪ Skipped ! File is maybe not existing.${NC}"
    echo ""
fi

if [[ -f ~/.zshrc ]]; then

    if [[ $(grep -c "alias cla" ~/.zshrc) -eq 1 ]]; then
        sed -i "s/alias cla=\"source create-laravel-app\"//g" ~/.zshrc
        # remove empty line
        sed -i '/^$/d' ~/.zshrc
    fi

    if [[ $(grep -c "alias create-laravel-app" ~/.zshrc) -eq 1 ]]; then
        sed -i "s/alias create-laravel-app=\"source create-laravel-app\"//g" ~/.zshrc
        sed -i '/^$/d' ~/.zshrc
    fi

    echo -e "${GREEN}${BOLD}↪ Uninstall completed !${NC}"
    exec zsh

elif [[ -f ~/.bashrc ]]; then

    if [[ $(grep -c "alias cla" ~/.bashrc) -eq 1 ]]; then
        sed -i "s/alias cla=\"source create-laravel-app\"//g" ~/.bashrc
        sed -i '/^$/d' ~/.bashrc
    fi

    if [[ $(grep -c "alias create-laravel-app" ~/.bashrc) -eq 1 ]]; then
        sed -i "s/alias create-laravel-app=\"source create-laravel-app\"//g" ~/.bashrc
        sed -i '/^$/d' ~/.bashrc
    fi

    echo -e "${GREEN}${BOLD}↪ Uninstall completed !${NC}"
    exec bash

fi
