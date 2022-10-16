#!/bin/bash

function die {
  echo "$1"
  exit 1
}

d2s_file_location="$(</etc/diablo-2-tools/selected_char.conf)"
if [ ! -f "$d2s_file_location" ] ; then
  die 'ERROR: your toon does not seem to exist.'
fi

cd /usr/local/share/diablo-2-tools/ || die 'ERROR: could not CD to /usr/local/share/diablo-2-tools/'
perl 'make free.pl' || die 'make free.pl FAILED'
echo 'cd /usr/local/share/diablo-2-tools/'
echo 'perl change.pl'
