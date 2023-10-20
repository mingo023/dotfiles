function __fzfp
  fzf-tmux -p -w 70% -h 70%
end

function fpass
  set prompt 'Search password: '

  if not test -d $HOME/.password-store
    echo "Could not locate password store directory. Please ensure $HOME/.password-store is setup."
    return
  end

  set passfile (find -L "$HOME/.password-store" -path '*/.git' -prune -o -iname '*.gpg' -print \
              | sed -e 's/.gpg$//' | sed -e 's/\/Users\/'$(whoami)'\/.password-store\///' \
              | sort \
              | eval __fzfp)

  if test -z "$passfile"
    echo 'No passfile selected.'
    return
  end

  pass show "$passfile" --clip; or return
end

