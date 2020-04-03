#
# ~/.bashrc
#
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias vifm='~/.dwm/vifmrun'

export VISUAL=vim
export EDITOR="$VISUAL"

if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\][\h\[\033[01;36m\] \w\[\033[01;31m\]]\$\[\033[00m\] '
else
	PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \w\[\033[01;32m\]]\$\[\033[00m\] '
fi


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

