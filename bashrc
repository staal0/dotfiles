#
# ~/.bashrc
#

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


alias ls='ls --color=always'
alias grep='grep --colour=auto'
alias vifm='~/.dwm/vifmrun'
alias mocp="mocp -T ~/.moc/themes/tty"
alias xprop="xprop | awk '/^WM_CLASS/{sub(/.* =/, \"instance:\"); sub(/,/, \"\nclass:\"); print} /^WM_NAME/{sub(/.* =/, \"title:\"); print};'"
export VISUAL=vim
export EDITOR="$VISUAL"
export _JAVA_AWT_WM_NONREPARENTING=1


if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \w\[\033[01;31m\]]\$\[\033[00m\] '
else
	PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \w\[\033[01;32m\]]\$\[\033[00m\] '
fi


ll() {
lines=$( ls -la $1 | wc -l )
 if [[ $lines -gt 90 ]] ; then
   ls -lha "$@" | less -iXRS
 else
   ls -lha "$@"
 fi
}


cconv() {
 echo -n $1" "$2" "=" "
 curl -s https://currency-api.appspot.com/api/$2/$3.json?amount=$1 | sed 's/^{.*.amount"://' | sed 's/,"m.*//'
 echo " "$3
}


genpasswd() {
 local l=$1
 [ "$l" == "" ] && l=16
 tr -dc '_+/!@#$%A-Za-z0-9' < /dev/urandom | head -c ${l} | xargs
}

bin2hex() {
echo "obase=16;ibase=2;$1"|bc
}


bin2dec() {
echo "ibase=2;$1"|bc
}


dec2bin() {
echo "obase=2;$1"|bc
}

dec2hex() {
echo "obase=16;$1"|bc
}

hex2dec() {
echo "ibase=16;${1^^}"|bc
}

hex2bin() {
echo "obase=2;${1^^}"|bc
} 

echo 
fortune -as
echo

