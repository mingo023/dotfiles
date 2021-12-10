function! Fix()
    let s:filename=@%
    silent execute "!eslint_d --fix " . s:filename
endfunction
command! -bang -complete=buffer -nargs=? Fix call Fix()