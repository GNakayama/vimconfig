#
# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# setup prompt
if [ ! "$HOME/.bash_prompt" ]; then
	. ~/.bash_prompt
fi

# setup aliases
if [ ! "$HOME/.aliases" ]; then
	. ~/.aliases
fi
