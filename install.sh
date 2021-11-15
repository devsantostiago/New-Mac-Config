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

main () {
   install_homebrew
   install_brew_dependencies
   install_oh_my_zsh
   install_zinit
   install_zinit_packages
}

main "$@"
