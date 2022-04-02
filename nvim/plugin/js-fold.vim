function! FoldAnalysis()
    let line = getline(v:lnum)
    if match(line, '^import') > -1
        return "1"
    elseif line == ""
        return "<1"
    else
        return '='
    endif
endfunction
