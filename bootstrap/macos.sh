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

setup_mac_config() {
  # hide desktop icons
  defaults write com.apple.finder CreateDesktop false
  killall Finder

  # reduce keyrepeat for faster typing in vim
  defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

  # change wallpaper
  # osascript -e 'tell application "Finder" to set desktop picture to POSIX file "/Users/minh.ngovan/.config/wallpaper/lofi-coffee.jpg"'
}

install_homebrew() {
  read -r -p "Do you want to install homebrew? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    success "🎊 Installed homebrew Successfully, please do brew's constructions"
  fi
}

install_fish() {
    info "Installing fish"

    brew install fish
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

    # set fish as default shell
    sudo sh -c "echo '/opt/homebrew/bin/fish' >> /etc/shells"
    chsh -s /opt/homebrew/bin/fish
}

install_languages() {
  read -r -p "Do you want to install languages? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
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
    brew install --cask font-jetbrains-mono-nerd-font
    brew install --cask font-hack-nerd-font
    brew install --cask sf-symbols

    success "Installed font!"
  fi
}

install_terminal() {
  read -r -p "Do you want to install alacritty? [y|N] " response
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

    success "Installed neovim"
  fi
}

install_tmux() {
  read -r -p "Do you want to install tmux? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install tmux
    rm -f ~/.tmux.conf
    cd ~/.dotfiles/terminals && stow tmux -t ~/

    rm -rf ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    chmod +x  ~/.dotfiles/terminals/tmux/session-menu

    # install tmux term
    curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz

    /usr/bin/tic -xe tmux-256color terminfo.src
    sudo /usr/bin/tic -xe tmux-256color terminfo.src
    /usr/bin/tic -xe alacritty-direct,tmux-256color terminfo.src
  fi
}

install_tools() {
  read -r -p "Do you want to install some fancy tools ? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install ripgrep
    brew install fd
    brew install neofetch
    brew install pgcli
    brew install bat
    brew install httpie
    brew install fzf
    brew install asciinema
    brew install gnu-sed
    brew install exa
    brew install git-delta

    success "Installed some fancy tools"

    brew install --cask google-chrome
    brew install --cask visual-studio-code
    brew install --cask postman
    brew install --cask notion
    brew install --cask raycast
    brew install --cask spotify
    brew install --cask shottr
    brew install orbstack
    brew install --cask betterdisplay
    brew install MonitorControl
    brew install --cask obsidian

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

install_ctags_ruby() {
  read -r -p "Do you want to ruby ctags to support neovim? [y|N] " response
  if [[ $response =~ (y|yes|Y) ]];then
    brew install universal-ctags

    git clone https://github.com/tmm1/ripper-tags ~/ripper-tags

    sudo ln -s ~/ripper-tags/bin/ripper-tags /usr/local/bin/ripper-tags
  fi
}


setup_mac_config
install_homebrew
setup_tmux
install_fish
install_languages
setup_git
install_font
install_terminal
install_nvim
install_tmux
install_tools
install_typescript_tools
install_golang_tools
install_ctags_ruby

echo "Finish Install! 🎉 🚀"
