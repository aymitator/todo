#!/bin/bash

function die {
  echo "$1"
  exit 1
}

#XXX gotta make sure that when JM-inserter.go accepts more arguments
#    those are passed to JM-inserter.go !
if [ -z "$1" ] ; then
  die 'd2-insertItem.sh 4a4d10008009239123d02'
fi
if [ "$#" -ne 1 ]; then
  die 'd2-insertItem.sh only accepts 1 argument [item-code/item-name/whatever] at this time [ie. at-a-time]'
fi

#TODO: testme
d2s_location="$(</etc/diablo-2-tools/selected_char.conf)"

#XXX what if it has a newline at the end? will it fail?
if [ ! -f "$d2s_location" ] ; then
  die 'ERROR: your toon does not seem to exist.'
fi

cd /usr/local/share/diablo-2-tools || die 'ERROR: could not CD to /usr/local/share/diablo-2-tools'
go run JM-inserter.go "$1" || die 'JM-inserter.go FAILED' #insert the file.
perl change.pl '@5make00000000' || die 'change.pl FAILED' #fix the checksum.

