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
alias ggpull='git pull origin (current_branch)'
alias ggl='git pull origin (current_branch)'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add .'
alias gd='git diff'
alias gcmsg='git commit -m'
alias md='mkdir -p'
alias gfo='git fetch origin'
alias gs='git stash'

function ggpush
    # Check if the last argument is '--force'

    set arg "$argv[-1]"
    if test "$arg" = "--force"; or test "$arg" = "-f"
        echo "🚧 use --force-with-lease instead of --force <ngungok>"
        read -l -P '❔ Do you want to git push with --force-with-lease? Type: current-branch to push 💭: ' confirm
        switch $confirm
          case (current_branch)
            set_color blue; echo "🚀 git push --force-with-lease origin (current_branch)"; set_color normal
            git push --force-with-lease origin (current_branch)
          case '' N n
            return 1
        end
    else
        # If '--force' is not the last argument, execute the git push command
        git push origin (current_branch)
    end
end
