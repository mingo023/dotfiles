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

setup_tmux() {
    ln -s ~/.config/.tmux/.tmux.conf ~/.tmux.conf
}

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update --force --quiet
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/minhngo/.config/fish/config.fish
    eval "$(/opt/homebrew/bin/brew shellenv)"
    success "Installed homebrew"
  fi
}

install_fish() {
    info "Installing fish"

    brew install fish
    brew install starship
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
}

install_languages() {
  read -r -p "Do you want to install languages? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install node
    success "Installed NodeJs"
    brew install go
    success "Installed Golang"
  fi
}


setup_git() {
  read -r -p "Do you want to setup git? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    git config --global user.email "$1"
    git config --global user.name  "$2"
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
    brew install neovim

    info "Installing packer"
    git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim

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
    brew install gnu-sed

    success "Installed some fancy tools"

    brew install --cask google-chrome
    brew install --cask visual-studio-code
    brew install --cask postman
    brew install --cask notion
    brew install --cask raycast
    brew install --cask spotify
    brew install --cask jetbrains-toolbox
    brew install --cask shottr

    success "Installed working tools"
  fi
}

install_typescript_tools() {
    read -r -p "Do you want to install typescript tools? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
        npm i -g typescript
        npm i -g vscode-eslint-language-server
        npm i -g prettier
        npm i -g typescript-language-server typescript

        success "Installed typescript tools"
    fi
}

install_golang_tools() {
    read -r -p "Do you want to install golang tools? [y|N] " response
    if [[ $response =~ (y|yes|Y) ]];then
        go install golang.org/x/tools/gopls@latest

        success "Installed golang tools"
    fi
}

setup_tmux
install_fish
install_homebrew
install_languages
setup_git
install_font
install_terminal
install_nvim
install_tmux
install_tools
install_typescript_tools
install_golang_tools

echo "Finish Install! 🎉 🚀"
