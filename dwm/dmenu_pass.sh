#!/usr/bin/env bash
## assumes your password store in ~/.password-store (default)
## you will need to create "~/.notes-store" folder to store your notes.
TERM=alacritty

shopt -s nullglob globstar

prefix=${PASSWORD_STORE_DIR-~/.password-store}
password_files=( "$prefix"/**/*.gpg )
password_files=( "${password_files[@]#"$prefix"/}" )
password_files=( "${password_files[@]%.gpg}" )

fix=${NOTES_DIR-~/.notes-store}
notes_files=( "$fix"/**/*.txt )
notes_files=( "${notes_files[@]#"$fix"/}" )
notes_files=( "${notes_files[@]%.txt}" )

echo -e "password view\npassword edit\nnew password\nremove password\nnotes view\nnotes new/edit\nnotes remove" | dmenu -p SELECT: > /tmp/x

grep -o "password view" < /tmp/x && printf '%s\n' "${password_files[@]}" | dmenu -p PASS: > /tmp/a && notify-send -u critical "$(pass show $(< /tmp/a) 2>/dev/null)" && exit
grep -o "pasword edit" < /tmp/x && printf '%s\n' "${password_files[@]}" | dmenu -p PASS: > /tmp/a && $TERM -e pass edit $(< /tmp/a) && exit
grep -o "new password" < /tmp/x && cat /dev/null | dmenu -p PASS: > /tmp/a && $TERM -e pass edit $(< /tmp/a) && exit
grep -o "remove password" < /tmp/x && printf '%s\n' "${password_files[@]}" | dmenu -p PASS: > /tmp/a && $TERM -e pass rm $(< /tmp/a) 2>/dev/null && exit

grep -o "notes view" < /tmp/x && printf '%s\n' "${notes_files[@]}" | dmenu -p Notes: > /tmp/a && notify-send -u normal -t 900000000 "$(cat ~/.notes-store/$(< /tmp/a).txt 2>/dev/null)" && exit
grep -o "notes new" < /tmp/x && printf '%s\n' "${notes_files[@]}" | dmenu -p Notes: > /tmp/a && $TERM -e vim ~/.notes-store/$(< /tmp/a).txt && exit
grep -o "notes remove" < /tmp/x && printf '%s\n' "${notes_files[@]}" | dmenu -p Notes: > /tmp/a && $TERM -e rm ~/.notes-store/$(< /tmp/a).txt 2>/dev/null && exit
