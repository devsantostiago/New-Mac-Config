# New-Mac-Config

<p align="center">
    <img src="images/terminal-icon.png" width="100" height="100" alt="">
</p>

<h1 align="center">Dotfiles Template</h1>

#### Requirements
- macOS Catalina or above

## Goal 
Setting up a new mac can be a painful experience when it has to be done from scratch. Making sure that you have configured correctly your machine with the same packages, aliases, terminal preferences and general customizations is almost impossible to replicate each time.

The purpose of this project is to serve as a template for your dotfiles configuration, abstracting all the complexity that manually configuaring your machine comes with.

## This script installs:
- [Homebrew](https://brew.sh)
####
- [Brew Casks](https://formulae.brew.sh/cask/)
    - Iterm2
    - Visual Studio Code
    - Slack
    - Proxyman
    - Spotify
    - Notion
    - Caffeine
####
- [Brew Packages](https://brew.sh)
    - dockutil
    - fasd
    - fzf
    - z
    - git
    - mas
    - n
    - rcm
    - trash
    - diff-so-fancy
    - robotsandpencils/made/xcodes
    - thefuck
    - shellcheck

In case you want to **add** or **remove** any of the **casks** or **packages** listed above, all you have to do is to edit the `Brewfile` that lives under the **brew** folder.

#### [Oh-My-Zsh](https://ohmyz.sh)
#### [Zinit](Zinit)
#### Custom Packages
- Git
- Zinit
#### MacOS
- Dark mode activation
- Typping speed and key sleep
- Dock manipulation
- iTerm2 customization
#### Xcode
- latest version
#### Generate SSH-Key

## How to run
```shell
git clone git@github.com:devsantostiago/New-Mac-Config.git
cd New-Mac-Config
chmod +x install.sh
chmod +x tests/tests.sh
./install.sh "Your custom ssh password"
```

## Tests
At the end of the setup script, the tests are automatically triggered and a report is printed to the screen.

<p align="center">
    <img src="images/tests-success.png" width="500" height="500" alt="">
</p>

## CI - Workflows
### Run installation script
The workflow is triggered **manually** and will simulate `install.sh` in a macOS [runner](https://github.com/actions/runner).

### Run tests script
The workflow is triggered **manually** and will simulate `tests.sh` in a clean macOS [runner](https://github.com/actions/runner).
The objective of this workflow is to prove that all the tests do fail. Keep in mind that the macOS runner already has the following packages by default:
- Homebrew
- Git

