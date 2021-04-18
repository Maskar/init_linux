#!/usr/bin/env bash

echo "Warning:"
echo "OH-MY-ZSH and all customizations will be removed!"
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -fR $HOME/.oh-my-zsh
    rm -f $HOME/.zsh*
    rm -f $HOME/.zcomp*
    rm -f $HOME/.p10k.zsh
fi
echo "Cleaned up!"