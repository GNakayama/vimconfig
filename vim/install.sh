#!/bin/bash

# Functions
function install_font_icons {
  /bin/git clone https://github.com/ryanoasis/nerd-fonts.git
  cd nerd-fonts/
  ./install.sh Mononoki
  cd ../
  /bin/rm -rf nerd-fonts/
}

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

# Install mononoki font if it is not installed
if ! ls $HOME/.local/share/fonts/NerdFonts/mononoki* 1> /dev/null 2>&1; then
	install_font_icons
fi

# Install ctags if it is not installed
if ! yaourt -Qi universal-ctags-git 1> /dev/null 2>&1; then
	yaourt universal-ctags-git
fi
