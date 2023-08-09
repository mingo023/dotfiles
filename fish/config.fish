if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH /opt/homebrew/bin:$PATH
set -gx PATH $HOME/bin:/usr/local/bin:$PATH

# GO Setup
set -gx GOPATH $HOME/go
set -gx GOROOT "/opt/homebrew/opt/go/libexec"
set -gx PATH $PATH $GOPATH/bin

set -gx NVM_DIR $HOME/.nvm
set -gx USE_GKE_GCLOUD_AUTH_PLUGIN True

set fish_path $HOME/.config/fish

. $fish_path/git_aliases.fish
. $fish_path/custom_variables.fish

alias ls="exa -l --icons"
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
    echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')    '(set_color red)(whoami)'@'(hostname)'
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')'(set_color yellow)'    Uptime: '(set_color white)(uptime | sed 's/.*up \([^,]*\), .*/\1/')(set_color red)'
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')    IP Address: '(set_color white)(ipconfig getifaddr en0)(set_color red)'
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)     '(set_color yellow)'Version: '(set_color white)(echo $FISH_VERSION)(set_color red)'
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)'(set_color normal)
end

function wpp
  set home $HOME
  set wallpaper (exa $home/.config/wallpapers | fzf)
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$home/.config/wallpapers/$wallpaper\""
end
