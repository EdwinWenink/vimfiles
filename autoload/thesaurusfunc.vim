def g:thesaurusfunc#Thesaurusfunc(findstart: bool, base: string): any
    # Adjusted from https://github.com/vim/vim/issues/1611#issuecomment-963482693
    if findstart
        return searchpos('\<', 'bnW', line('.'))[1] - 1
    endif
    var l: list<string> = &thesaurus->readfile()
    if l->empty() | return [] | endif
    var idx: number = l->match('^' .. base)
    if idx == -1 | return [] | endif
    var synonyms: list<string> = l[idx]->split(',')
    return synonyms
enddef
