#!/usr/bin/env bash

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -fR $HOME/.oh-my-zsh
    rm -f $HOME/.zsh*
    rm -f $HOME/.p10k.zsh
fi
