" If Python is not available, do not load some plugins that will constantly
" throw warnings.
if !has('python3')
    let g:did_plugin_ultisnips=1
endif

" By not specify a path, Plug automatically defaults to `~/.vim/plugged` on Unix
" and to `~/vimfiles/` on Windows.
call plug#begin()

" General {{{1

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips'   " See ~/vimfiles/ultisnip/  and :UltisnipEdit

"File explorers
Plug 'tpope/vim-vinegar'

" Fuzzy file finding
Plug 'ctrlpvim/ctrlp.vim'

" Airline bar at bottom of vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Default settings everyone can agree on
Plug 'tpope/vim-sensible'

" Handy mappings
Plug 'tpope/vim-unimpaired'

" Git wrapper
Plug 'tpope/vim-fugitive'

" More useful hlsearch
Plug 'romainl/vim-cool'

" Surround with brackets (yss new surroundings, cst" change, ds" delete )
Plug 'tpope/vim-surround'

" Support for using ds, cs and yss with the . command
Plug 'tpope/vim-repeat'

" Autocompletion that only uses native vim autocomplete features
" Plug 'lifepillar/vim-mucomplete'

" Linting, autocompletion, LSP {{{1

" Deoplete Autocompletion
"if has('nvim')
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'
"endif

" Deoplete + Jedi (do not forget to install Jedi)
" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'davidhalter/jedi-vim'

" Code formatting
" NOTE candidate for deletion
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" ALE Asynchronous Linting Engine
Plug 'dense-analysis/ale'

" LSP for Vim
" Replace Jedi with LSP?
" Plug 'prabirshrestha/vim-lsp'
" vim-lsp-settings can be used for managing language servers
" :LspInstallServer installs server for the current supported filetype
" Plug 'mattn/vim-lsp-settings'
" Will automatically kick in if you set g:ale_linters for a specific filetype
" Plug 'rhysd/vim-lsp-ale'
" Integration with UltiSnips
" Plug 'thomasfaingnaert/vim-lsp-snippets'
" Plug 'thomasfaingnaert/vim-lsp-ultisnips'

" Flake8 Python Linting
" If I keep using ALE, becomes obsolete
" but perhaps still nice to have as a simple backup
" Plug 'nvie/vim-flake8'

" Programming general {{{1

" Javascript syntax
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Autclose bracket-like symbols
" TODO disable autopair for prose style types like .txt and .md
Plug 'jiangmiao/auto-pairs'

" Terraform (syntax, :Terraform, :TerraformFmt)
Plug 'hashivim/vim-terraform'

" Smooth navigation between vim and tmux panels
Plug 'christoomey/vim-tmux-navigator'

" Send keys to a target, in my use case a REPL inside a tmux pane
Plug 'jpalardy/vim-slime'

" Add shortcuts for efficiently commenting out lines in visual mode (cc to comment out selection, c<space> to toggle comment of line)
Plug 'scrooloose/nerdcommenter'

" Keeps track of git changes
" Plug 'airblade/vim-gitgutter'

" Plain text workflow {{{1

" Vim wiki
" Plug 'vimwiki/vimwiki'
Plug 'lervag/wiki.vim'

" Vim notes
" Plug 'xolox/vim-notes'
" Plug 'xolox/vim-misc'

" Todo.txt
Plug 'freitass/todo.txt-vim'
Plug 'EdwinWenink/capture-todo.vim'

" Plug 'junegunn/vim-journal'

" Quiz yourself
Plug 'EdwinWenink/vim-quiz'

" Writing: pandoc, markdown, latex {{{1

" Integration of vim with pandoc
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'masukomi/vim-markdown-folding' "Because I disabled folding in vim-pandoc for now

" Goyo and limelight for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Markdown
"Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'
Plug 'godlygeek/tabular'
"Plug 'prashanthellina/follow-markdown-links'  "Press ENTER to follow link
"Plug 'plasticboy/vim-markdown'

Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'

" Latex
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold' "simple regexpr for folding sections

" Autocorrect common typos
" Custom list of iabbrev (1 sec delay on startup)
"Plug 'panozzaj/vim-autocorrect'
" This plugin just accepts the default Vim suggestion (dangerous?)
"Plug 'sedm0784/vim-you-autocorrect'

" Themes {{{1

" Install theme packages
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'NLKNguyen/papercolor-theme'

" Initialize plugin system
call plug#end()
