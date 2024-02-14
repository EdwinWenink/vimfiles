" ------------------ NOTETAKING SYSTEM ---------------------------
"  TODO turn into plugin
"
" Overview of bindings (assuming "\" as leader key)
" All note taking command start with "\n"
" rg executable is assumed for now (I should have regular grep as fallback)
"
" \ni  go to index file (currently tag_index.md)
" \nz  Create a new Zettelkasten entry
" \nu  Call python update script
" \ng  Ngrep
" \nt  Tgrep
" \nv  Vlist
"
" Other useful bindings:
"
" \st  Use CtrlP to search tags (from ctags; TODO can I pass a custom tags file?)
" \tt  Generate ctags for current working directory
" Ctrl-P Ctrl-X  insert markdown link for current search match
"
" TODO Ngrep en tgrep alleen in Zettelkasten laten zoeken MITS ik alle
" notities daarin zet

" Set your note directories here
" TODO notes_dir is defined in the global vimrc; decise whether to use notes_dir or zettelkasten
" TODO fnameescape(fnamemodify(..., ":p")) is necessary to expand ~ e.g. in cmd.exe; do here or elsewhere?
let g:notes_dir = fnameescape(fnamemodify('~/Documents/Notes/', ':p'))
let g:zettelkasten = fnameescape(fnamemodify('~/Documents/Notes/', ':p'))

" 'Notes Grep' with ripgrep (see grepprg)
" -i case insensitive
" -g glob pattern
" ! to not immediately open first search result
" TODO update path to variable
command! -nargs=1 Ngrep grep! "<args>" -i -g "*.md" "C:/Users/Edwin Wenink/Documents/Notes/"
" TODO functie maken om fnameescape(notes_dir) te gebruiken; evalueer
" variabele met execute
nnoremap <leader>ng :Ngrep
" Tips: use :lne(xt) and :lp(revious) or :lopen for navigation.
" The \c escape makes the search case insensitive

" Do a Vimgrep on the current word
" https://vim.fandom.com/wiki/Find_in_files_within_Vim
" map <leader>c :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Variant for searching a tag starting with @
" Prepopulate search with <cword>tag under cursor, but allow replacement
" TODO are optimalizations possible, e.g. stopping search early?
" TODO update to path variable
command! -nargs=1 Tgrep grep! "@<args>" -i -g "*.md" "C:/Users/Edwin Wenink/Documents/Notes/"
"nnoremap <leader>t :Tgrep <cword>

" Helper function for calling Tgrep
" If empty string is provided (default), then the word under the cursor
" is used as the search pattern
" TODO check for rg and use vimgrep as fallback if not present
:function! TagGrep(word)
:	if a:word == ""
:		execute "Tgrep ". "<cword>"
:	else
:		execute "Tgrep ". a:word
:	endif
:endfunction

nnoremap <leader>nt :call TagGrep("")<left><left>

" Open local list in a right vertical split (good for Ngrep results)
" Not anymore: I use the quickfix list now
command! Vlist botright vertical copen | vertical resize 50
nnoremap <leader>nv :Vlist<CR>

" open index of my notes and set working directory to notes
nnoremap <Leader>ni :cd ~/Documents/Notes/<CR>
" <cr>:e tag_index.md<cr>

" Quickly create a new entry into the "Zettelkasten"
" (automatically adds markdown extension)
"nnoremap <leader>nz :e C:/Users/Edwin\ Wenink/Documents/Notes
" TODO take the filename and insert it as the default title on top of the new file
" Have a look at TemplateFallback from lervag/wiki.vim
command! -nargs=1 NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . "-<args>.md"
nnoremap <leader>nz :NewZettel

" Notes update ('nu'): run python update script
nnoremap <leader>nu :execute ":!python" zettelkasten . "update.py"<CR>

" Suggestions by Jared on my website
" https://www.edwinwenink.xyz/posts/48-vim_fast_creating_and_linking_notes/#b64351f0-d40d-11ea-a360-6f00b702838a
" nnoremap <buffer> gf f(gf
" my version handles round brackets in link descriptor
nnoremap <buffer> gf f]f(gf
nnoremap <buffer> <c-w>f f(<c-w>f

" Suggestion by Anton on same post as above
" Find backlinks to current file and open quickfix list with the results
" command! -nargs=0 Ngrepl :execute 'grep -F "' . ' ]( ' . expand("%:t") . ' )' .  '"' | :copen 1
command! -nargs=0 Ngrepl :execute 'grep! -e "]\(\s?' . expand("%:t") . '\s?\)"' | :clist
nnoremap <leader>nb :Ngrepl<CR>

" Vim wiki in combination with my own notetaking setup

let g:wiki_root = '~/Documents/Notes'
let g:wiki_filetypes = ['md', 'markdown']
let g:wiki_link_extension = '.md'
let g:wiki_link_target_type = 'md'
let g:wiki_index_name = 'wiki'  " No index because index.md will be rendered by Hugo
" Default mappings: |wiki-mappings-default|
" wiki-graph-in
" wiki-link-zotero -> can I make this work with Jabref?
" Also good support for tags; default parser parses tags like :this:
" Can override this with my own convention, or instead switch to this
" has several fzf functions; also CtrlP I think
" g:wiki_map_create_page -> make such that it's consistent with my NewZettel command
" g:wiki_map_link_create -> edit the name of the link
function! TemplateFallback(context)
  call append(0, '# ' . a:context.name)
  call append(1, '')
endfunction

let g:wiki_templates = [
    \ { 'match_func' : {x -> v:true},
    \ 'source_func': function('TemplateFallback')},
    \]



" -------------- CtrlP setup for markdown notes ---------------- "

" CtrlP general settings
let g:ctrlp_match_window = 'bottom,order:ttb'

" Binding for searching tags ("Search Tag")
nnoremap <leader>st :CtrlPTag<CR>

" Binding that is handier e.g. for finding Python classes and definitions
" ("Search Buf tag")
nnoremap <leader>sb :CtrlPBufTag<CR>

" By default search on filenames and not paths
" let g:ctrlp_by_filename = 1

" Make CtrlP just use Vim's current working directory
let g:ctrlp_working_path_mode = 0

" Make ctrlp and vimgrep use ripgrep
if executable('rg')
  set grepprg=rg\ --color=never\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" CtrlP function for inserting a markdown link with Ctrl-X
" Adapted from: https://vi.stackexchange.com/questions/8976/is-there-a-way-to-insert-a-path-of-the-file-instead-of-opening-it-with-ctrlp-plu
function! CtrlPOpenFunc(action, line)
   if a:action =~ '^h$'
      " Get the filename
      let l:filename = fnameescape(fnamemodify(a:line, ':t'))
      let l:filename_wo_timestamp = fnameescape(fnamemodify(a:line, ':t:s/\(^\d\+-\)\?\(.*\)\..\{1,3\}/\2/'))
      let l:filename_wo_timestamp = substitute(l:filename_wo_timestamp, "_", " ", "g")

      " Close CtrlP
      call ctrlp#exit()
      call ctrlp#mrufiles#add(filename)

      " Insert the markdown link to the file in the current buffer
	  let mdlink = "[". l:filename_wo_timestamp . "]( " . l:filename . " )"
      put=mdlink
  else
      " Use CtrlP's default file opening function
      call call('ctrlp#acceptfile', [a:action, a:line])
   endif
endfunction

let g:ctrlp_open_func = {
         \ 'files': 'CtrlPOpenFunc',
         \ 'mru files': 'CtrlPOpenFunc'
         \ }


" -------------- FZF setup for markdown notes ---------------- "
"  Snippets from comment section: https://www.edwinwenink.xyz/posts/48-vim_fast_creating_and_linking_notes/

" TODO why is this not correctly loaded on startup?

" Fernando (this replicates my CtrlP setup; I only added the fnamemodify again)
function! HandleFZF(file)
    let filename = fnameescape(fnamemodify(a:file, ":t"))
    let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[ ".filename_wo_timestamp." ]( ".filename." )"
    put=mdlink
endfunction

" My own setup: l for "link"
command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)
"command! NoteFZF :call fzf#run({'sink': 'HandleFZF'})
command! LinkNoteFZF :call fzf#run({'sink': 'HandleFZF', 'down': '25%'})
"TODO zoek andere mapping dan C-l
"nnoremap <C-l> :LinkNoteFZF<CR>
" <C-o> runs normal command from insert mode and exits back to insert
" mode afterwards
"inoremap <C-l> <C-o>:LinkNoteFZF<CR>


" hbenevides and frobert
" make_note_link: List -> Str
" returned string: [Title](YYYYMMDDHH.md)
function! s:make_note_link(l)
        " fzf#vim#complete returns a list with all info in index 0
        let line = split(a:l[0], ':')
        let ztk_id = l:line[0]
        try
            let ztk_title = substitute(l:line[2], '\#\+\s\+', '', 'g')
        catch
            let ztk_title = substitute(l:line[1], '\#\s\+', '', 'g')
        endtry
            let mdlink = "[" . ztk_title ."](". ztk_id .")"
            return mdlink
endfunction

" TODO doesn't seem to work great yet; closes window immediately in most cases
" mnemonic link zettel
inoremap <expr> <c-;> fzf#vim#complete(fzf#vim#with_preview({
  \ 'source':  'rg --no-heading --smart-case  ^\#',
  \ 'reducer': function('<sid>make_note_link'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'up':    5}))

" General fzf settings

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS .= ' --inline-info'
" Broken on Windows (not using WSL)
"let g:fzf_preview_window = 'right:60%'

"augroup fzf
  "autocmd!
  "autocmd! FileType fzf
  "autocmd  FileType fzf set laststatus=0 noshowmode noruler
    "\| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"augroup END

" Customize fzf colors to match your color scheme
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }


" ---------------- Hide Markdown Links ---------------- "
"  I wanted this feature from plasticboy/vim-markdown
"  Source: https://github.com/plasticboy/vim-markdown/blob/master/syntax/markdown.vim

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown

" TODO ik snap eigenlijk waarom de link nu goed werkt
" TODO delete; vond toch dat vim-pandoc-syntax did al deed, LOL

" [link](URL) | [link][id] | [link][] | ![image](URL)
" contained online weggehaald voor conceal
"syntax region MarkDownID matchgroup=MarkDownDelimiter start="\[" end="\]" oneline conceal cchar=?
"syntax region MarkDownURL matchgroup=MarkDownDelimiter start="(" end=")" oneline conceal cchar=!
"syntax region MarkDownLink matchgroup=MarkDownDelimiter start="\\\@<!!\?\[\ze[^]\n]*\n\?[^]\n]*\][[(]" end="\]" oneline skipwhite
"highlight! def link MarkDownID Identifier
"highlight! def link MarkDownURL String
"highlight! def link MarkDownURL Underlined
"highlight! def link MarkDownDelimiter Delimiter

" ---------------- WIP ---------------- "

" Mostly old efforts to work with JSON file

" TODO Write function that writes tags to a tags file
" Read all "@" staments in the first n lines of a file (to avoid e.g.
" @Override matching)
" Write them somewhere, but without duplicates
" Result should be sorted
" Potentially follow standard ctags or helptags syntax so that :tags command
" can be used

" TODO Decode JSON tags file using native Vim functions
" I do not know how to pass a file to json_decode
:function! ReadTagsJSON()
":	e C:\Users\Edwin Wenink\Documents\Notes\tags.json
:	let test_dict = json_decode('{"a":["b"]}')
:	echo test_dict.a
:endfunction

" From https://vim.fandom.com/wiki/Append_output_of_an_external_command
:command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

"TODO I do not know how to avoid these wrapper functions
" Searches JSON index using jq
command! -nargs=1 SearchJSONTags R jq -r ".<args>" "C:\Users\Edwin Wenink\Documents\Notes\tags.json"<CR>
" Wrapper function for making arguments lowercase
:function! IndexTagSearch(tag)
: let l:lower_tag=tolower(a:tag)
: execute "SearchJSONTags " . l:lower_tag
: cd ~/Documents/Notes
:endfunction
nnoremap <leader>nT :call IndexTagSearch("")<left><left>

"TODO e.g. here I would need to find a way to expand the current filename
"TODO replace all references to ~/Documents/Notes with a variable
"expand("%:t") into the command itself...
" Find backlinks to current document
" TODO DOESNT WORK DONT KNOW WHY"
command! -nargs=1 SearchJSONBacklinks R jq -r "<args>" "C:\Users\Edwin Wenink\Documents\Notes\backlinks.json"<CR>
:function! SearchBacklinkJSON()
: execute "SearchJSONBacklinks " . expand("%:t")
: cd ~/Documents/Notes
:endfunction

" Native Vim alternative: search backlinks to current file in backlinks.json
" Only match key values (end with ":")
" Move cursor to first link after finding match
:function! SearchBacklink()
: let current_file=expand("%:t")
: cd ~/Documents/Notes
" Can I combine opening that file with the search?
" Because then the file wouldnt open if the search fails
: e backlinks.json
: execute "normal /" . current_file . ".*:/+1\<CR>w"
:endfunction

"nnoremap <leader>nb : call SearchBacklink()<CR>
