#!/bin/bash

function die {
  echo "$1"
  exit 1
}

d2s_character_location="$(</etc/diablo-2-tools/selected_char.conf)"

if [ ! -f "$d2s_character_location" ] ; then
  die 'ERROR: your toon [from the path located in the string in the file /etc/diablo-2-tools/selected_char.conf] does not seem to exist.'
fi


num2target_out(){
  printf '/var/cache/diablo-2-tools/%03d.d2s' "$1"
}

num=1
target_out="$(num2target_out "$num")"
while [ -f "$target_out" ] ; do
  (( num++ ))
  target_out="$(num2target_out "$num")"
done
unset num


echo cp --interactive --verbose "'$d2s_character_location'" "$target_out"
cp --interactive --verbose "$d2s_character_location" "$target_out"
