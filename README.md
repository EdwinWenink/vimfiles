# My Vim files

On Unix this repository should be saved as `~/.vim/`.
On Windows this repository should be saved as `~/vimfiles/`.

Another annoying difference is that under Unix your `vimrc` is stored as `~/.vimrc` and under Windows as `~/_vimrc`.
We get more consistency by storing our `vimrc` in this repository *without* a prefix.

I use [vim-plug](https://github.com/junegunn/vim-plug) for managing external plugins.
They will be stored in a `plugged/` folder after you open Vim and run `:Plug install`.

## TODO

Make sure vimrc runs without errors even when no plugins are loaded.

## Reading materials for configuring Vim

- https://github.com/romainl/idiomatic-vimrc
- https://vimways.org/2018/from-vimrc-to-vim/
