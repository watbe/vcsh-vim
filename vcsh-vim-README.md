# vcsh-vim
dotfiles for vim. see watbe/vcsh-zsh-server for more details.

## Warning
Do not run `:PluginInstall` or `:PluginUpdate` within the vcsh chroot!

## Requirements
1. Vim with LUA support (for neo-complete). Install `vim-nox` on Ubuntu.
2. `apt-get install silversearcher-ag` - for faster CtrlP action
2. Install Vundle manually (step 2 in [Vundle.vim](https://github.com/VundleVim/Vundle.vim))

## Setup
1. Run `:PluginInstall`
1. To install GoFormat, etc, run `:GoInstallBinaries`/`:GoUpdateBinaries`
