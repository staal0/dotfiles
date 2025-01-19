set fish_greeting
set -x BROWSER firefox
set -Ux EDITOR helix
set -x VISUAL helix
set -x EDITOR helix
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

bind [P delete-char

contains /home/staal/.dwm $fish_user_paths
contains /home/staal/.local/bin $fish_user_paths
contains /home/staal/.cargo/bin $fish_user_paths

alias ls='eza -o --git'
alias batdiff='git diff --name-only --diff-filter=d | xargs bat --diff'
alias hx="helix"

abbr --add gst git status
abbr --add lg lazygit

function genpasswd --argument number
    if test -z $number
        set l 16
    else
        set l $number
    end
    tr -dc '_+/!@#$%A-Za-z0-9' </dev/urandom | head -c {$l} | wl-copy -p
end

function bin2hex --argument bin
    echo "obase=16;ibase=2;$bin" | bc
end

function bin2dec --argument bin
    echo "ibase=2;$bin" | bc
end

function dec2bin --argument dec
    echo "obase=2;$dec" | bc
end

function dec2hex --argument dec
    echo "obase=16;$dec" | bc
end

function hex2dec --argument hex
    set x (echo $hex | tr a-z A-Z)
    echo "ibase=16;$x" | bc
end

function hex2bin --argument hex
    set x (echo $hex | tr a-z A-Z)
    echo $x
    echo "obase=2;ibase=16;$x" | bc
end

echo
fortune -as
echo

zoxide init --cmd cd fish | source
starship init fish | source
