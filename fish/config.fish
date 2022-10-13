if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH /opt/homebrew/bin:$PATH
set -gx PATH $HOME/bin:/usr/local/bin:$PATH

set -gx GOPATH $HOME/go
set -gx GOROOT "$(brew --prefix golang)/libexec"
set -x PATH $PATH $GOPATH/bin

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

function work
    ~/dev/work/
end

function dev
    ~/dev/
end

function learning
    ~/dev/learning/
end

