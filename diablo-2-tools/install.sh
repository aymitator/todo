#!/bin/bash

[ "$(id -u)" = '0' ] || exit 23


#XXX: 0% sure
#printf '%s\n' "[nothing installed yet.] is the 'go' command installed/usable/executable by your regular [normal?] user [ie. within \$PATH]?"
# XXX: the '-r' switch is an assumption not an option
#read -r -n 1 -p '? (idk/idc/continue-anyways) '


#XXX needs testing
#TODO is '-f' like ever necessary for ``rm''? 0.9% yes.
[ -f share/diablo-2-tools/MAN_PAGE_SORTA_README.txt ] && rm -v share/diablo-2-tools/MAN_PAGE_SORTA_README.txt
cp -iv README.txt share/diablo-2-tools/MAN_PAGE_SORTA_README.txt || exit 24

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
  cp -v bin/$i /usr/local/bin/
  echo chmod +x /usr/local/bin/$i
  chmod +x /usr/local/bin/$i
done

cp -Rv share/diablo-2-tools /usr/local/share/

mkdir -v /etc/diablo-2-tools

echo touch /etc/diablo-2-tools/selected_char.conf
touch /etc/diablo-2-tools/selected_char.conf

echo chmod a+w /etc/diablo-2-tools/selected_char.conf
chmod a+w /etc/diablo-2-tools/selected_char.conf

mkdir -v /var/cache/diablo-2-tools

echo chmod a+w /var/cache/diablo-2-tools
chmod a+w /var/cache/diablo-2-tools

#XXX needs testing
rm -v share/diablo-2-tools/MAN_PAGE_SORTA_README.txt || { echo exit 25; exit 25; }
