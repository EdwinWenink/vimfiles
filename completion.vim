" Mucomplete {{{2
" This plugins does nothing more than automatically triggering omnifunc
" which normally requires pressing Ctrl-X Ctrl-O
"Toggle with :MUcompleteAutoToggle
" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#completion_delay = 1

" I seem to have introduced some sort of recursive fallback in the case of
" tex, when a completion is not found.
"let g:mucomplete#chains = {
    "\ 'default' : ['path', 'omni',  'ulti', 'keyn', 'dict', 'uspl'],
    "\ }

" Jedi autocompletion {{{2

" There is a weird bug where if I press backspace in the omnifunc menu I get a
" brief popup.
" Also not completion is not automatic for some reason...

" Jedi-vim: autocompletion for Python
" deoplete-jedi provides integration with Deoplete
" Disable jedi-vim completions to use deoplete-jedi instead
" TODO figure out how jedi-vim and deoplete-jedi interact
" Do not use both?
" Jedi-vim still provides parameter previewing
let g:jedi#completions_enabled = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
let g:jedi#documentation_command = "K"
"let g:jedi#goto_command = "<localleader>g"
"let g:jedi#goto_assignments_command = "<localleader>a"
"let g:jedi#goto_stubs_command = "<localleader>s"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#usages_command = "<localleader>u"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<localleader>r"

" Deoplete {{{2
" Requires pip3 install --user pynvim
" let g:deoplete#enable_at_startup = 1

" Pass a dictionary to set multiple options
"
"call deoplete#custom#option({
"\ 'auto_complete_delay': 100,
"\ 'auto_complete': v:true,
"\ 'auto_complete_popup': 'auto',
\ 'smart_case': v:true,
"\ })

" Completion sources
" You can also directly use a LSP server as a source here
" jedi-vim with deoplete worked quite okay for me
" NOTE not sure which source is the correct name...
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})

" ALE {{{2

" Pip install isort
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autoimport', 'isort', 'remove_trailing_lines' ,'trim_whitespace']
\}
let g:ale_fix_on_save = 1

" Pip install mypy and python-lsp-server (not python-language-server!)
let g:ale_linters = {
    \   'python': ['pylsp', 'mypy'],
    \ }

" TODO hoe zorg ik ervoor dat pylsp setup.cfg of .flake8 oppikt?
" let g:ale_python_pylsp_config = {
    "\   'pylsp': {
    "\     'plugins': {
    "\       'pycodestyle': {
    "\         'enabled': v:true
    "\       }
    "\     }
    "\   },
    "\ }

" LSP integration
let g:ale_disable_lsp=0
let g:lsp_diagnostics_enabled = 1
let g:ale_lsp_suggestions = 1
let g:ale_lsp_show_message_severity = 'information'

" How ALE displays information
" Echo in the message line
let g:ale_echo_cursor = 1
let g:ale_hover_cursor = 1

" How to modify text_align; text_wrap properties
" Show virtual text information only for current line
let g:ale_virtualtext_cursor = 'current'

" Replaces balloon/message line on hover with the preview or floating window
let g:ale_hover_to_preview = 0
let g:ale_close_preview_on_insert = 0
" Floating window for ALEDetail command
let g:ale_floating_preview = 1
" Is equivalent to:
"let g:ale_detail_to_floating_preview = 1
"let g:ale_hover_to_floating_preview = 1
" Automatically open preview-window with error/warnings on hover
let g:ale_cursor_detail = 0
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" If you do not use ALE as a source for Deoplete but standalone,
" turn the following setting on to use ALEs own completion engine
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 1
let g:ale_completion_max_suggestions = 25  " 50 is default
" Set omni completion function to ALE's omnifunc
" Triggered by <C-X> <C-O>
" I don't see a big differnce with the default completion
" set omnifunc=ale#completion#OmniFunc

" Let airline show ALE information
let g:airline#extensions#ale#enabled = 1

" To automatically call ALEHover on cursor hover
" we need to define the following
augroup ale_hover_cursor
  autocmd!
  autocmd CursorHold *.py ALEHover
augroup END

