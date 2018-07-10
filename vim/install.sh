#!/bin/bash

# Creates backup directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/tmp/backup"
fi

# Creates undo directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/tmp/undo"
fi

# Creates swap directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/tmp/swap"
fi

# Creates bundle directory
if [ ! -d "$HOME/.vim/bundle/" ]; then
	/bin/mkdir -p "$HOME/.vim/bundle"
fi

# Install Vundle plugin manager
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
	/bin/git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ -f "$HOME/.vimrc" ]; then
	/bin/rm "$HOME/.vimrc"
fi


/bin/ln .vimrc $HOME/.vimrc
/bin/vim +PluginInstall +qall
