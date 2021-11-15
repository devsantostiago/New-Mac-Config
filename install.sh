#!/bin/bash

install_homebrew () {
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

install_brew_dependencies () {
  echo "Installing Brew Dependencies"
  brew bundle --file=brew/Brewfile || echo "INFO: Some applications were already installed."
}

main () {
   install_homebrew 
   install_brew_dependencies
}

main "$@"
