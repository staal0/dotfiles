set fish_greeting
set -x BROWSER qutebrowser
set -Ux EDITOR vim
set -x VISUAL vim
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x _JAVA_AWT_WM_NONREPARENTING 1

set -x CPATH $CPATH:/usr/include/gtk-2.0
set -x CPATH $CPATH:/usr/include/glib-2.0/
set -x CPATH $CPATH:/usr/lib/glib-2.0/include/
set -x CPATH $CPATH:/usr/include/pango-1.0/
set -x CPATH $CPATH:/usr/lib/gtk-2.0/include/
set -x CPATH $CPATH:/usr/include/atk-1.0/

bind [P 'delete-char'

contains $HOME/.dwm $fish_user_paths;
contains $HOME/.local/bin $fish_user_paths;

alias ls='ls --color=always'
alias grep='grep --colour=auto'
alias mocp="mocp -T ~/.moc/themes/tty"
alias xprop="xprop | awk '/^WM_CLASS/{sub(/.* =/, \"instance:\"); sub(/,/, \"\nclass:\"); print} /^WM_NAME/{sub(/.* =/, \"title:\"); print};'"
alias batdiff='git diff --name-only --diff-filter=d | xargs bat --diff'

function cconv --argument number from to
 echo -n $number $from =" "
 curl -s "https://currency-api.appspot.com/api/"$from"/"$to".json?amount="$number | sed 's/^{.*.amount"://' | sed 's/,"m.*//'
 echo " "$to
end

function genpasswd --argument number
 if test -z $number
   set l 16
 else
   set l $number
 end
 tr -dc '_+/!@#$%A-Za-z0-9' < /dev/urandom | head -c {$l} | xargs
end

function bin2hex --argument bin
echo "obase=16;ibase=2;$bin"|bc
end

function bin2dec --argument bin 
echo "ibase=2;$bin"|bc
end

function dec2bin --argument dec 
echo "obase=2;$dec"|bc
end
 
function dec2hex --argument dec 
echo "obase=16;$dec"|bc
end
 
function hex2dec --argument hex
set x (echo $hex | tr a-z A-Z)
echo "ibase=16;$x"|bc
end
 
function hex2bin --argument hex 
set x (echo $hex | tr a-z A-Z)
echo $x
echo "obase=2;ibase=16;$x"|bc
end

echo
fortune -as
echo
