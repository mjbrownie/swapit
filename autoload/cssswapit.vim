fun cssswapit#CssSwapComplete(direction)
    let sline = split(getline("."), ":")

    if len(sline) == 2 " for a typical key:value line"
        let temp_reg = @s
        let cur_word = substitute(sline[1],"[^0-9A-Za-z_-]", "","g" )
        let matches = csscomplete#CompleteCSS(0, sline[0] . ": ")

        if index(matches,cur_word) != -1
            let word_index = index(matches, cur_word)

            if a:direction == 'forward'
                let word_index = (word_index + 1) % len(matches)
            else
                let word_index = (word_index - 1) % len(matches)
            endif
            let swap = sline[0]. ':' . substitute(sline[1], cur_word, matches[word_index], "")
            let result = setline(line("."), swap)
            return 1
        endif

        let @s = temp_reg
    endif
    return 0
endfun
