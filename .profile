# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.dwm" ] ; then
    PATH="$HOME/.dwm:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# read -t 5 -p "Start X11? [y]/n: "
# if test "$?" != 0 -o "$REPLY" = y -o "$REPLY" = Y -o "$REPLY" = ""
# then
# exec startx 1>~/.xout 2>~/.xerr
# fi

[ "$(tty)" = "/dev/tty1" ] && exec sway
