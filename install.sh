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

main () {
   install_homebrew
   install_brew_dependencies
   install_oh_my_zsh
}

main "$@"
