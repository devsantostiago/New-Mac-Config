#!/bin/bash

set -e
set -o pipefail

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

install_xcode () {
  if [ $install_xcode = false ]
  then
    echo "Installing Xcode - Skipped"
  else
    echo "Installing Xcode"
    xcodes install --latest
  fi
}

generate_ssh_key () {
  if [ -f "$HOME/.ssh/id_rsa.pub" ]
  then
    echo "Key ssh already created"
  else 
    echo "Generating and configuring ssh key"
    ssh-keygen -q -t rsa -N "$0" -f $HOME/.ssh/id_rsa <<<y >/dev/null 2>&1
    #Setup ssh config
    cp $PWD/packages/git/config $HOME/.ssh/config
    chmod 0644 $HOME/.ssh/config
  fi
}

launch_tests () {
  /bin/sh $PWD/tests/tests.sh
}

print_manual_configs_reminder () {
  export bold=$(tput bold)
  export normal=$(tput sgr0)

  echo "---------------------------------------------
    DONE - Now you just need to:
      ${bold}•  Change color presset to smooooooth
      •  Add infinite scroll
      •  Reboot to apply all changes
      ${normal}
  ---------------------------------------------"
}

main () {
   install_homebrew
   install_brew_dependencies
   install_oh_my_zsh
   install_zinit
   install_zinit_packages
   add_custom_git_config
   install_mac_and_iterm_defaults
   install_xcode
   generate_ssh_key
   launch_tests
   print_manual_configs_reminder
}

main "$@"
