#! /bin/bash
echo "---"

set -e

info () {
  printf "\r  [\033[00;34m..\033[0m] %s \n" "$1"
}

user () {
  printf "\r  [\033[0;33m??\033[0m] %s \n" "$1"
}

success () {
  printf "\r\033[2K [\033[00;32mOK\033[0m] %s \n" "$1"
}

fail () {
  printf "\r\033[2K [\033[0;31mFAIL\033[0m] %s \n" "$1"
  echo ''
  exit
}

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update --force --quiet
    success "Installed homebrew"
  fi
}

install_languages() {
  read -r -p "Do you want to install languages? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install node@16
    success "Installed NodeJs"
  fi
}


setup_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git config --global user.email "nvminh023@gmail.com"
    git config --global user.name  "Minh Ngo"
    git config --global color.ui true

    success "Setup Git Successfully"

    brew install lazygit
    success "Installed Lazygit"
  fi
}

install_font() {
  read -r -p "Do you want to install font? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew tap homebrew/cask-fonts 
    brew install --cask font-ubuntu-mono-nerd-font
    brew install --cask font-ubuntu-nerd-font
    brew install --cask font-jetbrains-mono
    brew install --cask font-hack-nerd-font

    success "Installed font!"
  fi
}

install_terminal() {
  read -r -p "Do you want to install kitty? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install --cask alacritty
    success "Installed alacritty!"
  fi
}

install_nvim() {
  read -r -p "Do you want to install neovim? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    info "Installing neovim"
    brew install lua
    brew install --HEAD neovim

    # reduce keyrepeat for faster typing in vim
    defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

    success "Installed neovim"
  fi
}

install_tmux() {
  read -r -p "Do you want to install tmux? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install tmux
    rm ~/.tmux.conf
    cd ~/.dotfiles/terminals && stow tmux -t ~/

    rm -rf ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    chmod +x  ~/.dotfiles/terminals/tmux/session-menu
  fi
}

install_tools() {
  read -r -p "Do you want to install some fancy tools ? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install ripgrep
    brew install neofetch
    brew install pgcli
    brew install bat
    brew install httpie
    brew install fzf
    brew install asciinema
    brew install efm-langserver

    success "Installed some fancy tools"

    brew install --cask google-chrome
    brew install --cask visual-studio-code
    brew install --cask postman

    success "Installed working tools"
  fi
}

install_typescript_tools() {
    read -r -p "Do you want to install typescript tools? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
        npm i -g typescript
        npm i -g eslint_d
        npm i -g prettier
        npm i -g typescript-language-server typescript

        success "Installed typescript tools"
    fi
}

install_docker() {
    read -r -p "Do you want to install docker? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
        brew install docker

        success "Installed docker"
    fi
}


install_homebrew
install_languages
setup_git
install_font
install_terminal
install_nvim
install_tmux
install_tools
install_docker
install_typescript_tools

echo "Finish Install! 🎉 🚀"
