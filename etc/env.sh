#!/bin/bash
# Switch to using fish as default shell
if ! fgrep -q '/usr/local/bin/fish' /etc/shells; then
  echo '/usr/local/bin/fish' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/fish;
fi;

# install fisherman
if [ ! -f ~/.config/fish/functions/fisher.fish ]; then
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
fi;
