# My Vim files

On Unix this repository should be saved as `~/.vim/`.
On Windows this repository should be saved as `~/vimfiles/`.

Another annoying difference is that under Unix your `vimrc` is stored as `~/.vimrc` and under Windows as `~/_vimrc`.
We get more consistency by storing our `vimrc` in this repository *without* a prefix.

I use [vim-plug](https://github.com/junegunn/vim-plug) for managing external plugins.
They will be stored in a `plugged/` folder after you open Vim and run `:Plug install`.

## Organisation

- `after` contains customizations that add to existing plugins
    * I apply some post-hoc highlighting rules to whatever color scheme is loaded
    * bindings for specific filetypes, such as programming languages
- `autoload`
    * simple functions that are not part of a plugin and are called in mappings
- `mappings.vim`
    * general mappings without side-effects
- `plugins.vim`
    * list of plugins that will be installed via vim-plug
- `spell`
    * spelling files
    * abbreviations
    * thesaurus
- `ultisnips`
    * snippets for various languages in UltiSnip format

## External dependencies to install

WIP:

- Deoplete requires: `python -m pip install pynvim`.
- `python -m pip install flake8`


## Reading materials for configuring Vim

- https://github.com/romainl/idiomatic-vimrc
- https://vimways.org/2018/from-vimrc-to-vim/
