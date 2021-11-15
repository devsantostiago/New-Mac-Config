#!/bin/bash

install_homebrew () {
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_brew_dependencies () {
  echo "Installing Brew Dependencies"
  brew bundle --file=brew/Brewfile || echo "INFO: Some applications were already installed."
}

install_oh_my_zsh () {
  echo "Installing oh-my-zsh"
  if [ ! -d "$HOME/.zshrc" ]
  then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

install_zinit () {
  echo "Installing Zinit"
  if [ ! "$commmand" -v zinit ]; then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma-continuum/zinit/master/doc/install.sh)"
  fi
}

install_zinit_packages () {
  echo "Installing zinit packages"
  rcup -d "packages/zinit"
}

add_custom_git_config () {
  echo "Adding custom gitconfig"
  rcup -d "packages/git"
  git config --global include.path "$PWD/git/gitconfig.local"
  git config --global user.name "devsantostiago"
  git config --global user.email "dev.santostiago@gmail.com"
}

install_mac_and_iterm_defaults () {
  echo "Installing defaults"
  source ./defaults/mac
  source ./defaults/iterm2
}

main () {
   install_homebrew
   install_brew_dependencies
   install_oh_my_zsh
   install_zinit
   install_zinit_packages
   add_custom_git_config
   install_mac_and_iterm_defaults
}

main "$@"
