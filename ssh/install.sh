#!/bin/bash

if [ ! -d "$HOME/.ssh/" ]; then
	/bin/mkdir "$HOME/.ssh"
fi

/bin/ln config $HOME/.ssh/config
