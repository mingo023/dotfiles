if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH /opt/homebrew/bin:$PATH
set -gx PATH $HOME/bin:/usr/local/bin:$PATH

set -gx GOPATH $HOME/go
set -gx GOROOT "/opt/homebrew/opt/go/libexec"
set -gx PATH $PATH $GOPATH/bin
set -gx NVM_DIR $HOME/.nvm
set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True

set fish_path $HOME/.config/fish

. $fish_path/git_aliases.fish
. $fish_path/custom_variables.fish
 

alias ls="ls -la"
alias rm="rm -rf"
alias zshconfig="nvim ~/.config/zshrc/.zshrc"
alias reload="source ~/.config/fish/config.fish"
alias nvconfig="nvim ~/.config/nvim"
alias tmuxconfig="nvim ~/.config/.tmux/.tmux.conf"
alias alconfig="nvim ~/.config/alacritty"
alias tmux="tmux -u"
alias nv='nvim'
alias k='kubectl'
alias lg='lazygit'
alias ct-be='cd ~/dev/chotot/be'
alias kp='k get pods'

function work
    ~/dev/work/
end

function dev
    ~/dev/
end

function learning
    ~/dev/learning/
end

starship init fish | source

function fish_greeting
    echo Hello dai ca 🤪🤗
    echo The time is (set_color yellow; date +%T; set_color normal)
end
