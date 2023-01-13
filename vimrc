" Edwin's VIM.

" Vim settings {{{1
" -----------------

" ~/.vim on Unix and ~/vimfiles on Windows
" Note: this assumes you have placed your vimrc in this folder!
let VIMHOME=fnamemodify(expand('$MYVIMRC'), ':p:h')

" Initialize plugins
runtime plugins.vim

" Load general mappings that do *not* depend on specific filetypes
" Filetype specific mappings should be stored under `ftplugin`
runtime mappings.vim

" Abbreviations
runtime spell/iabbrev.vim

" WIP automatically download Notes if it does not exist yet, using vim-fugitive
let g:notes_dir=expand('~/Documents/Notes/')
if !isdirectory(expand('~/Documents/Notes')) && exists(':Git') > 0
    execute ":Git clone https://github.com/EdwinWenink/Notes " . g:notes_dir
endif

" Enable modification of buffer contents
set modifiable 

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Include subfolders in path
set path+=**

" Enable spellchecking (':set spell' to enable again)
set spell

" Use multiple spell languages by default
" Set to utf-8 before, otherwise you'll need asci and latin versions as well
set spelllang=en_us,nl

" Set spellfile in a system agnostic manner
" We use two languages and two spell files
" Add to the first spellfile (English) with 1zg, the second (Dutch) with 2zg
let &spellfile=VIMHOME . '/spell/en.utf-8.add' . ',' . VIMHOME . '/spell/nl.utf-8.add'

" Define thesaurus files (insert mode <C-x><C-t>)
" Source: https://www.gutenberg.org/files/3202/files/mthesaur.txt
let &thesaurus=VIMHOME . '/spell/mthesaur.txt'

" Note: by default Vim only allows spaces as a delimiter so this thesaurus is
" not parsed correctly, e.g. does not work with multi-word phrases.
" Since Vim 8.2 you can specify a custom completion function to fix this.
" Note: about versioning... the passed function is Vim9script
if has('eval') && v:version > 802
    set thesaurusfunc=g:thesaurusfunc#Thesaurusfunc
endif

" Enable syntax highlighting
syntax on 

" Filetype detection. If you use syntax these are already enabled by default
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
endif

" Autoindent
set autoindent

" Intuitive backspace behavior
set backspace=indent,eol,start

" Show current line numbering at bottom-right
set ruler

" Highlight current line
set cursorline

" Use Vim's default command-line completion.
" Default behavior: <TAB> to move and <CR> to validate
set wildmenu

" Make dir search (wildmenu) ignore certain files for speedup
set wildignore+=*/.git/*,*/tmp/*,*.swp,*.pyc

" Completion menu options
set completeopt+=menuone
set completeopt+=longest
set completeopt+=noselect
"set completeopt+=popup "preview "popup

" don't give |ins-completion-menu| messages.
set shortmess+=c

"Disable vim beeping during completion
set belloff=all 

" always show signcolumns
set signcolumn=yes

" Modline settings
set laststatus=2  "Always show
set noshowmode    "Avoid showing mode (e.g. -- INSERT -- ) below airline

" Settings for vim search
set incsearch
set hlsearch
set ignorecase
set infercase

" Allow switching buffers with unsaved work
set hidden

" Change default 8 column tab to 4 column tab
:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Folding
set foldlevel=1         " Set fold level: max level to fold on opening a file
set foldmethod=marker   " Let markers like }}}0 define folds of level 1 (specific ftplugins should override this)
set foldignore=         " By default # is ignored because it's a C directive. Not handy for Python etc.

" Set updatetime of .swp file (changed for faster LaTeX preview).
" Default=4000
set updatetime=400

" Automatically re-read files if unmodified in vim
set autoread

" Keep n lines above and below the cursor
set scrolloff=999

" Behavior of splits
set splitright
set nosplitbelow

" Virtual edit in visual block mode; handy for ragged lists
set virtualedit=block

" Enable digraph mode for entering special characters. Ä is produced by typing
" A, then backspace, then ':'
" set digraph

" Windows requires unnamed instead of unnamedplus
set clipboard^=unnamed,unnamedplus

" When set, a forward slash is used when expanding file names and backward
" slashes are converted by Vim
set shellslash

" Put swap files in a dedicated vimswap folder under VIMHOME
" The ending // enforces absolute paths for the swap files
" We append the default settings as a fallback
let &directory=VIMHOME . '/vimswap//,' . &directory

" Settings gVim on Windows
if has ('gui_running')
	if has ('gui_win32')
		set guifont=PragmataPro_Mono_Liga:h11, guifont=Courier_New:h11, guifont=Consolas:h11
		" Disable gui clutter for gVim
		set guioptions-=m  "menu bar
		set guioptions-=T  "toolbar
		set guioptions-=r  "scrollbar
		" Prevent annoying jumping after resizing
		set guioptions-=r
		set guioptions-=L
        " Set shell
        set shell=cmd.exe
		" Windows assumes colon to be part of path names
		" but that breaks references like file.txt:linenumber
		set isfname -=:
	endif
endif

" Style {{{1
" ----------

" Apply my own ad-hoc styling rules *after* loading a color scheme
" Ref: https://vi.stackexchange.com/a/24847
" TODO is there a better way of running the python specific highlights only for Python files?
augroup colors
    au!
    autocmd ColorScheme * runtime after/colors/common.vim
    autocmd ColorScheme * runtime after/colors/python.vim
augroup END

" On Windows, set a colorscheme
" On Unix, take over terminal style (from .Xresources)
if has('win32')
    " Enable a colorscheme
    set background=light
    if filereadable(VIMHOME . '/plugged/papercolor-theme/colors/PaperColor.vim')
        colorscheme PaperColor
    endif
else
    " Note: we set a default because otherwise the augroup with after/
    " settings from above has nothing to override.
    colorscheme default
endif

" Programming languages {{{1
" --------------------------

" Python {{{2
" -----------

" See after/ftplugin/python.vim

" Javascript {{{2
" ---------------
" TODO put in separate file

augroup javascript
    autocmd!
    autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
    autocmd Filetype javascript set conceallevel=1
augroup END

" vim-javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

"vim-jsx-pretty'
let g:vim_jsx_pretty_colorful_config = 0 " default 0

" Java {{{2

" Compile java files from within vim
command! Javac !javac $(find . -name "*.java")

" HLSL shaders {{{2
augroup shader
    autocmd!
	autocmd BufNewFile,BufRead *.compute set ft=hlsl
	autocmd BufNewFile,BufRead *.compute set nospell
augroup END


" General plugin settings {{{1
" ----------------------------

" Deoplete {{{2
let g:deoplete#enable_at_startup = 1

" Pass a dictionary to set multiple options
"call deoplete#custom#option({
"\ 'auto_complete_delay': 100,
"\ 'smart_case': v:true,
"\ })

" Auto pairs {{{2
" Avoid conflict with Mucomplete
"let g:AutoPairsMapSpace = 0
"imap <silent> <expr> <space> pumvisible()
 "  \ ? "<space>"
 "  \ : "<c-r>=AutoPairsSpace()<cr>"

"let g:AutoPairsMapCR = 0
"imap <Plug>MyCR<Plug>(MUcompleteCR)<Plug>AutoPairsReturn
"imap <cr><Plug>MyCR

" Issue: C-J is defined in imap.vim, but I want to use it with ultisnips and
" multicomplete. Set it to something else
" imap <C-space> <Plug>IMAP_JumpForward

" Ultisnips {{{2
" From help mucomplete-compatibility

" Defaults:
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" Not sure whether this is useful
" According to :help , interferes with default binding i_CTRL-X_CTRL-K
let g:UltiSnipsBackwardTrigger = "<s-tab>"

" Mucomplete {{{2
" Expand snippet on selecting mucomplete entry
" inoremap <silent> <expr> <plug>MyCR
     "\ mucomplete#ultisnips#expand_snippet("\<cr>")
" imap <cr> <plug>MyCR

" let g:mucomplete#enable_auto_at_startup = 1 "Toggle with :MUcompleteAutoToggle
" let g:mucomplete#completion_delay = 1

" I seem to have introduced some sort of recursive fallback in the case of
" tex, when a completion is not found.
let g:mucomplete#chains = {
    \ 'default' : ['path', 'omni',  'ulti', 'keyn', 'dict', 'uspl'],
    \ }

" Vim easy align {{{2
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Zeal offline documentation {{{2
" I didn't figure out how to change $ProgramFiles, but it points to x86 which I don't want
let g:zv_zeal_executable = has('win32')
            "\ ? $ProgramFiles . '\Zeal\zeal.exe'
            \ ? 'C:\Program Files\Zeal\zeal.exe'       
            \ : 'zeal'

"nmap gzz <Plug>Zeavim
"vmap gzz <Plug>ZVVisSelection
"nmap <leader>z <Plug>ZVKeyDocset
"nmap gZ <Plug>ZVKeyDocset<CR>
"nmap gz <Plug>ZVOperator
" Following are defaults; above are maps from plugin author
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset

let g:zv_file_types = {
            \   'python': 'python_3',
            \   'javascript': 'javascript,nodejs',
            \   'scss': 'sass',
            \   'sh'  : 'bash',
            \   'tex' : 'latex',
            \   'css': 'css,foundation',
            \    '.htaccess'                : 'apache_http_server',
            \    '\v^(G|g)runt\.'           : 'gulp,javascript,nodejs',
            \    '\v^(G|g)ulpfile\.'        : 'grunt',
            \    '\v^(md|mdown|mkd|mkdn)$'  : 'markdown',
            \ }


" Vimspector {{{2
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_install_gadgets = ['debugpy']

" Limelight and Goyo {{{2

" Settings for limelight with dark background (:help cterm-colors)
"let g:limelight_conceal_ctermfg = 'gray'
"let g:limelight_conceal_ctermfg = 240
"let g:limelight_default_coefficient=0.8

" Settings for limelight with white background (:help cterm-colors)
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient=0.8

" Settings for limelight in combination with gVim
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777' 

" Integrating limelight with Goyo: when Goyo is entered, go in limelight mode
" Show line number only in prose mode
" Upon entering Goyo, make the background light, resembling a paper

function! s:goyo_enter()
  silent !tmux set status off
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number
  Limelight
  " highlight Normal ctermbg=White
  " highlight Normal ctermfg=Black
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"autocmd! User GoyoEnter highlight Normal ctermfg=Black | highlight Normal ctermbg=White | set number | set bg=light | Limelight

"autocmd! User GoyoLeave Limelight! | set bg=dark | highlight Normal ctermbg=Black | set number!

" Vim Pencil {{{2
let g:pencil#wrapModeDefault = 'soft'
let g:pencil_higher_contrast_ui = 1
let g:pencil_terminal_italics = 1

augroup pencil
	autocmd!
	autocmd Filetype markdown,mkd call pencil#init()
	autocmd Filetype text call pencil#init()
augroup END

" Vim Markdown settings {{{2
let g:vim_markdown_folding_disabled=1

" Vim-pandoc and vim-pandoc-syntax (E.g. :Pandoc! pdf)
" let g:pandoc#modules#disabled = ["folding"]
" Temporarily disable these because they do not work with Python 3.7
let g:pandoc#modules#disabled = ["bibliographies", "command", "templates","menu"]
let g:pandoc#modules#warn_disabled = 0
let g:pandoc#syntax#conceal#urls = 1

" Pandoc and Latex (incl. some ad-hoc styling) {{{2

" TODO review whether the styling overrides are still necessary

" Use compound pandoc.markdown for best of both worlds
" TODO write a blogpost about this
augroup pandoc
    autocmd!
    autocmd Filetype pandoc,markdown set filetype=pandoc.markdown
    autocmd Filetype pandoc,markdown set conceallevel=1
    autocmd Filetype pandoc,markdown highlight Conceal ctermbg=NONE
    autocmd Filetype pandoc,markdown highlight Folded ctermbg=NONE
    "autocmd Filetype pandoc,markdown call AutoCorrect()
    "autocmd Filetype pandoc,markdown EnableAutocorrect
augroup END

augroup latex
	autocmd!
	autocmd Filetype tex highlight Folded ctermbg=NONE guibg=NONE
    autocmd Filetype tex highlight Conceal ctermbg=NONE guibg=NONE
    "autocmd Filetype tex EnableAutocorrect
augroup END

" Vimtex
let g:vimtex_enabled = 1
let g:vimtex_view_enabled = 1
let g:vimtex_view_method = 'general'
"let g:vimtex_view_general_viewer = 'mupdf'
let g:vimtex_view_general_viewer = 'SumatraPDF'
"let g:vimtex_complete_bib = { 'simple': 1 }
"let g:vimtex_complete_bib = { 'menu_fmt': '[@type] @author_all (@key), "@title"' }
let g:vimtex_compiler_progname = 'nvr'  " for neovim

let g:vimtex_compiler_latexmk = {
	\ 'backend' : 'jobs', 
	\ 'background' : 1,
	\ 'build_dir' : '',
	\ 'callback' : 1,
	\ 'continuous' : 0,
	\ 'executable' : 'latexmk',
	\ 'hooks' : [],
	\ 'options' : [
	\   '-verbose',
	\   '-file-line-error',
	\   '-synctex=1',
	\   '-interaction=nonstopmode',
	\ ],
	\}

" Vimtex toggle TOC
nnoremap <leader>lt :VimtexTocToggle<CR>

" Select Latex Compile Defaults
"filetype plugin indent off
"set shellslash
let g:tex_flavor = "latex"
let g:Tex_BibtexFlavor = 'biber'
"g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
""let g:Tex_DefaultTargetFormat='dvi'
"let g:Tex_MultipleCompileFormats='pdf'
"let g:Tex_ViewRule_pdf='yap -1'
"set runtimepath=~/.vom,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" Disable some native Vim plugins {{{1
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1

" }}}1
