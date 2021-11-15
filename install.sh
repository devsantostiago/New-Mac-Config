#!/bin/bash

install_homebrew () {
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

main () {
   install_homebrew 
}

main "$@"
