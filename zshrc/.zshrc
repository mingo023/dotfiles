# If you come from bash you might have to change your $PATH.
export PATH=/opt/homebrew/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/minhngo/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(zsh-autosuggestions)
plugins+=(git)
bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh

export CLICOLOR=1
if [[ $TERM == xterm ]]; then TERM=xterm-256color; fi

alias ls="ls -la"
alias rm="rm -rf"
alias zshconfig="nvim ~/.config/zshrc/.zshrc"
alias reload="source ~/.zshrc"
alias nvconfig="nvim ~/.config/nvim"
alias tmuxconfig="nvim ~/.config/.tmux/.tmux.conf"
alias alconfig="nvim ~/.config/alacritty"
alias tmux="tmux -u"
alias nv='nvim'
alias k='kubectl'
alias lg='lazygit'

# config project working directory
alias work='f(){ ~/dev/work/"$@";  unset -f f; }; f'
alias learning='f(){ ~/dev/learning/"$@";  unset -f f; }; f'
alias portbe='~/dev/work/portfolio/portfolio-management-backend'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
