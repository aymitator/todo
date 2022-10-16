#!/bin/bash

[ "$(id -u)" = '0' ] || exit 23


bin_files=(
d2-backupChar-Reads.sh
d2-changeSkills-Reads.sh
d2-insertItem-Alters.sh
d2-makeFree-Safe.sh
d2-renameChar-Safe.sh
d2-selectToonChar-Safe.sh
d2-showItems-Reads.sh
d2-stam2rejuv-Reads.sh
man-diablo-2-tools
)

for i in "${bin_files[@]}"; do 
  rm -v /usr/local/bin/$i
done

rm -frv /usr/local/share/diablo-2-tools
rm -iv /etc/diablo-2-tools/selected_char.conf
rmdir -v /etc/diablo-2-tools
rm -irv /var/cache/diablo-2-tools
