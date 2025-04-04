if status is-interactive
    # Commands to run in interactive sessions can go here
end

# status --is-interactive; and rbenv init - fish | source

set -gx PATH /opt/homebrew/bin:$PATH
set -gx PATH $HOME/bin:/usr/local/bin:$PATH

# GO Setup
set -gx GOPATH $HOME/go
set -gx GOROOT "/opt/homebrew/opt/go/libexec"
set -gx DENO_INSTALL "/Users/minhngo/.deno"
set -gx PATH $PATH $DENO_INSTALL/bin

set -gx PATH $PATH $GOPATH/bin
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx AWS_PROFILE lawbite

# config for HF projects
set -gx PATH ".git/safe/../../bin:$PATH"

# Python setup
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

set -gx NAVI_PATH $HOME/.config/navi/cheats


# Ruby setup
# set -gx GEM_HOME $HOME/.gem
# set -gx PATH $PATH:$(ruby -e 'print Gem.user_dir')/bin


set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True

set -U fish_user_paths $HOME/.config/composer/vendor/bin

set fish_path $HOME/.config/fish

. $fish_path/git_aliases.fish
. $fish_path/functions/fzf_pass.fish
. $fish_path/custom_variables.fish

alias ls="eza -l --icons"
alias rm="rm -rf"
alias zshconfig="nvim ~/.config/zshrc/.zshrc"
alias reload="source ~/.config/fish/config.fish"
alias tmux="tmux -u"
alias nv='nvim'
alias k='kubectl'
alias kk='k9s'
alias lg='lazygit'
alias kp='k get pods'
alias t='task'
alias c='clear'

function work
    ~/dev/work/
end

function dev
    ~/dev/
end

function learning
    ~/dev/learning/
end

function fish_greeting
end

function wpp
  set home $HOME
  set wallpaper (eza $home/.config/wallpapers | fzf)
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$home/.config/wallpapers/$wallpaper\""
end

zoxide init fish | source
~/.local/bin/mise activate fish | source

starship init fish | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/minhngo/.cache/lm-studio/bin

# pnpm
set -gx PNPM_HOME "/Users/minhngo/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

source /Users/minhngo/.config/op/plugins.sh
