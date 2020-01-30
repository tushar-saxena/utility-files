#!/bin/bash

char_string=">>>>>>>>>>>>>>>>"

wrap_char_string () {
  printf "\n\n"
  echo $char_string $1 $char_string
}

install_git () {
  wrap_char_string "installing git"
  sudo apt-get install git
  git config --global user.name "Tushar Saxena"
  git config --global user.email tushar.saxena@outlook.com
  git config --global pull.default current
  git config --global push.default current
}

install_terminator () {
  wrap_char_string "installing terminator"
  sudo apt-get install terminator
  sudo cp lib-files/config-settings/terminator/config ~/.config/terminator/
}

install_synapse () {
  wrap_char_string "installing synapse"
  sudo add-apt-repository ppa:synapse-core/ppa
  sudo apt-get update
  sudo apt-get install synapse
}

install_clipit () {
  wrap_char_string "installing clipit"
  sudo apt-get install clipit
  cp lib-files/config-settings/clipit/clipitrc ~/.config/clipit/
}

generate_sshkeys () {
  ls -al ~/.ssh
  ssh-keygen -t rsa -C "tushar.saxena@outlook.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  sudo apt-get install xclip
  xclip -sel clip < ~/.ssh/id_rsa.pub
  ssh -T git@github.com
}

install_flux () {
  wrap_char_string "installing flux"
  sudo add-apt-repository ppa:nathan-renniewaldock/flux
  sudo apt-get update
  sudo apt-get install fluxgui
}

install_tmux () {
  wrap_char_string "installing tmux"
  sudo apt install tmux
}

install_zsh () {
  wrap_char_string "installing zsh"
  sudo apt install zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

#install_git
# install_terminator
# install_synapse
# install_clipit
# install_flux
install_tmux
install_zsh
