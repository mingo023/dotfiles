function current_branch
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo $ref | sed s-refs/heads/--
end


function current_repository
  set ref (git symbolic-ref HEAD 2> /dev/null); or \
  set ref (git rev-parse --short HEAD 2> /dev/null); or return
  echo (git remote -v | cut -d':' -f 2)
end

alias gst='git status'
alias ggpush='git push origin (current_branch)'
alias ggpull='git pull origin (current_branch)'
alias gco='git checkout'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add .'
alias gd='git diff'
alias gcmsg='git commit -m'
alias md='mkdir -p'
alias gfo='git fetch origin'
