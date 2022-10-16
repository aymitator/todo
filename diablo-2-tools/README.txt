Diablo is a trademark or registered trademark of Blizzard Entertainment, Inc., in the U.S. and/or other countries.
This s***/software[?]/stuff-in-this-github-repository[?] is in no way affiliated with Blizzard Entertainment.

d2-insertItem-Alters.sh 1000800065000022f6860782251813be86e03f #adds horadric cube to top-left inventory

Diablo II: shit [why did I turn on my computer]


d2-backupChar-Reads.sh; cd /usr/local/share/diablo-2-tools/; perl change.pl @36make00100100; #I'm 90% sure this always works. Resurrect/recycle the dead hardcore [to life [to alive]]. Location 36 changing to 00100100 from 00101100


================================
Diablo II Tools! Version 19.4 (Sept 10 2022)
Just use https://github.com/WalterCouto/D2CE (ie. Diablo II [ie. Diablo 2] Character Editor) assuming it [ie. D2CE] exists longer than this project.
TARGET: linux + wine [any version 90% sure]         or windows + cygwin
VERSIONS of Diablo II TARGET: single-player Diablo II non-Resurrected (as I'm 39% sure LoD 1.14d) and [I'm 0% sure] Diablo II Resurrected 1.15+ [single-player]
HOW WELL TESTED: 100% tested on linux
                 0% tested on windows (with Cygwin, of course)
================================

WHAT DO MOST PEOPLE USE THIS STUFF [IE. SET OF $PATH COMMANDS] FOR [ASSUMING D2CE 0% EXISTED]?
-----------------
90% rename your character [ie.   d2-renameChar-Safe.sh   ]
10% extract a hacked item from an imported .d2s file [ie. character save] [ie.     d2-showItems-Reads.sh   ]
    AND put that hacked item into your whatever-character-save-file [ie. another [different][?] character save file]
      [ie. a ....nother[?] .d2s file]
      [ie.    d2-insertItem-Alters.sh $itemcode
        [$itemcode would look something like:  10088000650000d836b706029684fe97aa4004140ae63f
          [which contains item stats
            [except runes or gems inside of it
              [those are separate item codes
                [although there is some socket meta data in the original itemcode surely-surely [ie. righteously-so [?]]]]]
          like +13 to Life, a reference to its graphics, and where it is located
            [ie. the belt, the cube, as-equipment, in inventory, or in the stash
              [XXX: or in an item????
                [that is, in case the item is a gem [see LIST OF GEMS]
                  or jewel or rune [see LIST OF RUNES] in some other item [TODO: right?]]]]]



NEED FAST-CASH [IE. 420K GOLD IN LIKE 2 MINUTES]?

  Assumptions:  + you have a [horadric] cube.
                + your cube contents are empty.
                + you have access to Hell difficulty.
  #fills your whole cube with Perfect Skulls.
  for i in {1..12}; do d2-insertItem-Alters.sh money$i; done

NEED FAST-MANA [IE. 12 Tir RUNES TO PUT INTO ALL FREE-SOCKETED GEAR]?
  Assumptions:  + you have a [horadric] cube.
                + your cube contents are empty.
  #fills your whole cube with Tir Runes.
  for i in {1..12}; do d2-insertItem-Alters.sh mana$i; done


<linux assumption>
you're using wine to run Diablo II in ~/.wine or $WINEPREFIX installed somewhere in drive_c directory within that WINE configuration directory

YOU DO NOT NEED DIABLO II RUNNING to use these scripts.
Surely you'd want to exit out of your character in-game before editing its save D2S file.

<CAUTION>
you have to install [ie. sudo bash install.sh [on GNU/Linux]] the scripts in ./bin/ and ./share/diablo-2-tools
  in order for those scripts to be at least 38% functional.
IOW, you can't go:   cd bin; bash d2-renameToon-Safe.sh
  TODO: and why the f*** not?

<WINDOWS>
install cygwin to get a linux environment + linux terminal (all installed by default). The install exe is on their website (https://www.cygwin.com).
your Cygwin terminal needs to be ran as 'root'/admin to call
  bash install.sh
after the install you can revert back to your normal account/user
  terminal.
you can run the Cygwin terminal as admin by right-clicking your
  "Cygwin Terminal" shortcut on your Desktop and selecting
  "Run as administrator"
select to install cygwin perl5 package when you install cygwin
install golang with the Windows installer on their website (https://go.dev). The installer automatically adds the win32/win64/whatever `go` command
  to your system %PATH% environmental variable. Cygwin inherits the Windows 10/11 %PATH% in its own $PATH and can run Win32/Win64 programs within
  that environmental variable string/code/thing.
The go script this project uses assumes your Cygwin installation is on C:\ at C:\cygwin64
Now to run Diablo II tools you just fire up your GUI terminal (which should be available as a shortcutted program on your Desktop) and you're ready
  to install this project, install it (as stated below), and use it just like in linux.
NOTE: if you download this project's ZIP file you'll want to copy the ZIP file to C:\cygwin64\home\YourWindowsUsername\
      through the Windows explorer. That way you can unzip the file in Windows explorer, cd to the directory in your Cygwin terminal,
      and install/use as-usual

<TO_INSTALL_USE>
just go:  sudo bash install.sh #in Linux tty/terminal
just go:  bash install.sh #in Cygwin terminal on Windows
Now you can use all of my tools, YAAAAyyyyy

<TO_PURGE_FROM_SYSTEM>
(ie. to uninstall)
just go:  sudo bash uninstall.sh #in Linux tty/terminal
just go:  bash uninstall.sh #in Cygwin terminal on Windows

<FAQ>
- Where does this program target D2S files at?
when you call d2-selectToonChar-Safe.sh
all of your .d2s files within C:\Users (on Windows) or $WINEPREFIX/drive_c/users (on Linux if $WINEPREFIX exists)
                                                    or ~/.wine/drive_c/users (on Linux if $WINEPREFIX doesn't exist)
get printed out into your terminal/tty (output)
Then you can type the full path of the .d2s file and hit ENTER and now all of the diablo-2-tools will target that .d2s save file!

What these tools lack:
1) a way to edit stats (str, dex, health points, mana points, free stat points)
2) a way to edit item stats (although you can download d2s files and save the item codes for injecting into any character)
3) a way to revive your character if your character dies in hardcore
4) a way to get the cow portal if you killed cow king
5) a way to add gold to your inventory/stash (although you could insert a Perfect Gem and then sell it)
6) a way to reset certain quests like the act 5 free-socketing quest (although you could backup your character, use the quest, save the item code for
  insertion later, and then revert your save d2s character file lol)

<requires>
golang: the `go` command
perl5: the `perl` command

<LINUX GOLANG>
you probably have perl5 already installed. that works.
to get golang/go you can do:
<FEDORA LINUX> sudo dnf install golang
<DEBIAN LINUX> sudo apt install golang

<installed_files>
/usr/local/bin/d2-selectToonChar-Safe.sh #edit /etc/diablo-2-tools/selected_char.conf that is used by the scripts to know which Diablo 2 character you wish to edit/read/alter
               d2-backupChar-Reads.sh
               d2-changeSkills-Reads.sh #the HTML file to make this process solid uses sorceress images, but the system works for all 7 characters.
               d2-insertItem-Alters.sh
               d2-makeFree-Safe.sh
               d2-renameChar-Safe.sh  #valid characters:  a-Z0-9_- '++' @ end ????? XXX FIXME, invalid characters:  '--' @ end
               d2-showItems-Reads.sh
               d2-stam2rejuv-Reads.sh
               man-diablo-2-tools #shows this file, which is /usr/local/share/diablo-2-tools/MAN_PAGE_SORTA_README.txt
/etc/diablo-2-tools/selected_char.conf
/var/cache/diablo-2-tools #this is where we put revert.d2s (change.pl generates this as an auto-backup) and #.d2s (created incrementally by d2-backupChar-Reads.sh)
/usr/local/share/diablo-2-tools/change.pl           #can fix the checksum and alter the hex in the character at addresses
                                change skill.html   #a helper for /usr/local/bin/d2-changeSkills-Reads.sh, gets viewed with basically any graphical browser like firefox
                                cold.png            #a resource for 'change skill.html'
                                fire.png            #""
                                lightning.png       #""
                                get skill data.pl   #get the current character skill data to paste into change skill.html, this is called by d2-changeSkills-Reads.sh
                                JM-find-codes.pl    #locates all of the items in the D2S character save file, this is called by d2-showItems-Reads.sh
                                print-item-location.pl  #a helper for JM-find-codes.pl that uses the item information to find where it is located
                                                        #(belt, cube, equipment, inventory, stash)
                                JM-inserter.go      #insert any perfect gem or rune or custom item code (see ITEM CODES TO USE) into typically the cube
                                                    #(the address [ie. if the item is in the belt, in cube, equipped, in inventory, in stash] is
                                                    #included in the item code [as binary/hex[?] information[?]]).
                                                    #this is called by [bin/]d2-insertItem-Alters.sh
                                                    #d2-insertItem-Alters.sh fixes the checksum by calling change.pl
                                make free.pl        #gives change.pl copy-and-paste codes. this is called by d2-makeFree-Safe.sh
                                print-JM-potions.pl #searches for stamina potions and calls stam2rejuv.pl to convert them into regular rejuvs, called by d2-stam2rejuv-Reads.sh
                                rename-toon.pl      #prints out the change.pl codes and a bash/terminal/tty command you can copy and paste to successfully
                                                    #rename your toon/character/d2s-file, this is called by d2-renameChar-Safe.sh
                                stam2rejuv.pl       #prints out the change.pl codes to convert the stamina potions to regular rejuvs
                                MAN_PAGE_SORTA_README.txt #viewed by running /usr/local/bin/man-diablo-2-tools


And here are the tools to execute freely:
1) d2-selectToonChar-Safe.sh
enter the d2s file you wish to target/edit with all of the tools.
Searches ~/.wine/drive_c/users/ or $WINEPREFIX/drive_c/users
for d2s files
Once you enter your d2s-file/character-data-file/toon the path gets written to /etc/diablo-2-tools/selected_char.conf
2) d2-backupChar-Reads.sh
copies the character/toon/d2s-file where's location is stored in /etc/diablo-2-tools/selected_char.conf to
  /var/cache/diablo-2-tools/a-incremented-number.d2s
3) d2-changeSkills-Reads.sh
prints out the codes from the d2s-file/toon/character where's location is stored in /etc/diablo-2-tools/selected_char.conf to copy-and-paste into
  /usr/local/share/diablo-2-tools/change skill.html .. launched/viewed from firefox or epiphany or konqueror or chromium[-based] or opera or whatever
  Then in the HTML file you press the export
  button and copy and paste that into your terminal:
  cd /usr/local/share/diablo-2-tools/
  perl change.pl *copy-and-paste-here*
4) d2-insertItem-Alters.sh
FIXME: accept more than one item [ie. item-code/item-name] at-a-time.
insert an item via the first argument sent.
be sure your cube is empty before executing this!
and if you don't have a cube..
  d2-insertItem-Alters.sh 1000800065000022f6860782251813be86e03f #adds cube to top-left inventory
                                                                 #be sure that is clear before injecting
Add a rune example (sorta):
  d2-insertItem-Alters.sh runes_El  #adds El rune to cube
  d2-insertItem-Alters.sh runes_zod #adds Zod to cube
Add a gem example:
  d2-insertItem-Alters.sh gems_a     #adds a P. amethyst to cube
  d2-insertItem-Alters.sh gems_skull #adds a P. skull to your cube
Add a coded item:
  #the following two sequentially add the viper amulet and horadric staff in the cube for
  # act 2 normal!
  d2-insertItem-Alters.sh 10008000650000d83667068210710183c8c1075a3e9ce049c1b382a7054f17e37f
  d2-insertItem-Alters.sh 100080006500606897060702f7088e34c78d3d7040450295164bff01
5) d2-makeFree-Safe.sh
can access nightmare/hell & has all waypoints.
6) d2-renameChar-Safe.sh
safely rename a character ...
d2-renameChar-Safe.sh John Sally
I believe you can also go:
d2-renameChar-Safe.sh John.d2s SallyRide #or
d2-renameChar-Safe.sh John.d2s Megatron.d2s
These are all valid:
d2-renameChar-Safe.sh John Sally_
d2-renameChar-Safe.sh John Sallllllllllly_
d2-renameChar-Safe.sh John Sall-eeeeeeeeee
These are 0% valid:
d2-renameChar-Safe.sh John Sallllllllllly-
d2-renameChar-Safe.sh John John1    XXX: right?
7) d2-showItems-Reads.sh
show the codes of the current items in stash/inventory/cube/equipped/belt.
8) d2-stam2rejuv-Reads.sh
reads all of the stamina potions inside of your character and then you paste
  the output into here:
cd /usr/local/share/diablo-2-tools/
perl change.pl *copy-and-paste-here*
# and that will change your toon from stamina to regular rejuvs.



ITEM CODES TO USE QUICKSTART
d2-backupChar-Reads.sh                #just in case, right?
d2-insertItem-Alters.sh $item_code    #assuming you have selected a toon/character/d2s-target-file
                                      #with [bin/]d2-selectToonChar_Safe.sh
                                      #[ie. have /etc/diablo-2-tools/selected_char.conf with a string [no newlines]
                                      #of a [complete] file path pointing to a valid .d2s file]

ITEM CODES TO USE (ACTUAL CODES)

armor 3 socketed Ring Mail [body armor] (Defense: 54, Required Level: >0, Required Strength: 36) @ top-left of [horadric] cube
1008800065000028e7760602a433623cc6703bd0e03010162cf9fc07


helmet 3 socketed Mask [helmet] (Defense: 24, Required Level: >0, Required Strength: 23) @ top-left of [horadric] cube
10088000650000d836b706029684fe97aa4004140ae63f

weapon 4 socketed Flail [mace] [one-handed] @ top-left of cube
  attack-damage 1-24
  req-dex 35
  req-str 41
  req-level 0
1008800065000068c616060256e815ee98c0c303fd07

weapon 4 socketed Voulge [polearm] [two-handed] @ right-side of cube
  attack-damage 6-21
  attack-speed 1x [Normal Attack Speed]
  req-str 50
  req-level 0
1008800065000268f7560782ca764b62e25032376882004b3cff01

armor 4 socketed Gothic Plate [body armor] (Defense: 135, Required Level: >=0, Required Strength: 70) @ top-left of cube
1008800065000078468706828a22ec7ba420123721e83f

shield 3 socketed Tower Shield @ topleft cube
  chance-to-block 48%
  def 23
  req-level >=0
  req-str 70
1008800065000048f776070205c181fa9820043c3ce63f

charm add (ie. +) 1-2 Cold [damage] [ie. to your melee [basically physical damage surely]] GC [Grand Charm]
  req-level >=3
  @ top-left of cube
1000800065000038d6360382584e83c90f0d00d88a8d000119ff01

weapon 1 socketed wand [ie. necromancer-only] @ bottom-right of cube
  req-level 5 [ie. at least]
  skill-boost: +1 for all 30 necromancer skills [assuming they all at least have one point and are < level 99.]
100880006500447876e706828ef7039155a1021e1e44a8804c51fe83a3fe03

belt Sigons (req-str=60, req-level=6) @ top-left of cube
100080006500008826c6060278b63b5d5e7102288071211ca071c2e8bf35e83f

ring @ bottom-right of cube
  13 = required level
  [all] Damage -2
100080006500642897e60602e5d157390e2500d08108e13f

charm +22 to Mana GC (Required Level: 14) @ top-middle of cube
1000800065000238d6360382ab5eb1712c8d8f0040029bff

charm add (ie. +) 7% Faster Movement Speed GC [Grand Charm]
  req-level >=14
  @ bottom-right of cube
1000800065002438d6360302dc9d95bc2405003c0698cd7f

helmet 0 socketed (Defense: 56, Required Level: >=17, Required Strength: 41) @ bottom-right of [horadric] cube
  [all] Damage -7
100080006500426886c606821b74fa80e7a1044ae0e101820a0b080c880f1c10719c084a11b422a84550160185f80f

jewel @ bottom-left of cube
  required level 18
  +15 [Max?] [physical] Damage [and therefore for 4 socketed [body] armor, 3 socketed helmet, 2x 6 socketed crystal sword for a total of +285 to max [physical] damage] [and therefore for physical Assassin, Barbarian, werewolf Druid, zeal Paladin]
10008000650060a856760702b5c59e28221500788385078607a8c77f

amulet @ top-right of cube
  19 = required level
  [all] Damage -3
1000800065000418d656070283b47955110500d48188e13f

gloves @ top-left of cube
  25 def
  45 req str
  23 req lvl
  +1 fire skills [whatever that means..so fireball]
  +20% faster cast rate [so teleport faster I guess]
100080006500004877c606822916960bf091062c20210182870d191f280023c0401a949fe43f

weapon 6-socketed [dimensional [and therefore one-handed]] sword [and therefore Sword-class weapon [of course]] @ bottom-right of cube
  13-35 damage
  Durability max: 20
  25 required Level
  [60, 85] required Dexterity, Strength, respectively
10088000650022983326078250c08128a2808282fd07


ring @ bottom-right of cube
  29 = required level
  +69 [max] mana
  half freeze duration
100080006500642897e606022b0a5c27300d9cd84282323bff03


ring @ top-right of cube
  29 = required level
  +1 to all skill levels
  +25% of whatever max mana
100080006500042897e606022653d4d5f1153d90804646c04093f14ffe03


charm +42 to Mana GC (ie. Grand Charm [ie. it takes up 3 spaces vertically [and of course 1 space horizontally]]) (Required Level: >=29) @ top-left of cube
1000800065000038d63603020a87b3dc2b0d91004002a5ff


charm +5% faster hit recovery, +8 mana SC (ie. Small Charm 1x1 space) (Required Level: >= 29) @ bottom-right of cube
1000800065006438d61603029d26c0511d15972c4402943199ff


charm +57 to Mana, +7% Faster Run/walk GC (Required Level: >=41) @ top-left of cube
1000800065000038d63603825f9e6cd82205923c46822c309bff


charm +34 to Mana LC (ie. Large Charm 1x2 spaces) (Required Level: >=41) @ bottom-left of cube
1000800065004038d626038260e46057289595004002a1ff


boots @ bottom-left of cube
  139 def
  095 req str
  042 req lvl (at least)
  +25% run
  +25% walk [speed]
  +10 to a stat [ie. Strength] 
1000800065004088472706025316e337f1010f7420010380ca0015045f151e0b990b0f864c120f270a2896605a9a789f1e5099ff

jewel @ bottom-right of cube
  required level 49
  +5% cold skill damage
    (ie. eg. blizzard, frozen orb [ie. sorceress exclusive])
  -5% to enemy cold resistance
    (IOW: +5% [more] cold skill damage)
    (XXX: is this effect instant like an aura?)
10008000650064a85676078221302d56c1adc46003c3c440b17207f2d21b4f0bfe03

shield 3 socketed [monarch] shield @ top-left of cube
  required level 54
  156 required strength
100880006500005897460782b1000341a860135656e63f 

PALADIN-ONLY ITEMS ITEM-CODES
shield 4 socketed Herald Shield [paladin-only] (chance-to-block 40%, defense 19, req-level 12, req-str 40) @ left of cube
1008800065000008173603022f3dbd9398c8011d4041411114289800c17f
shield 4 socketed Protector Shield [paladin-only] (chance-to-block 40%, defense 147, req-level 34, req-str 69) @ left of cube
+24% (more) physical damage
10088000650000081786030273cdf847a2d8019d4041411130609840c27f


gems list as perfects = amethyst  diamond  ruby  sapphire  skull  topaz



runes list = amn  ber  cham  dol  el  eld  eth  fal  gul  hel  io  ist  ith  jah  ko  lem  lo  lum  mal  nef  ohm  ort  pul  ral  shael (faster attack speed, faster hit recovery, level 29 requirement)  sol (dmg reduced by 7 [even for shields])  sur  tal  thul  tir  um  vex  zod  



cube recipes #0001 add 1 socket to unsocketed rare-only [body] socketable item (shield/helmet/weapon/armor[bodyarmor]): 3 perfect skulls + stone of jordan (soj) + item with 0 sockets as rare as socketable item
cube recipes #0002 add random 1-3 sockets to 3% of-all-socketable-items [helmet] unsocketed unlow-quality unrare unmagical unsuperior uncrafted helmet: runes_ral gems_sapphire runes_thul  [look 2 lines below as reference]
cube recipes #0003 add random 1-4 sockets to 3% of-all-socketable-items [shield] to unsocketed unlow-quality unrare unmagical unsuperior uncrafted shield: runes_amn gems_ruby runes_tal [look 1 line below as reference]
cube recipes #0004 add random 1-4 sockets to 74% of-all-socketable-items [body armor] to unsocketed unlow-quality unrare unmagical unsuperior uncrafted armor [body armor]: 1 perfect topaz + 1 tal rune + 1 thul rune + item with 0 sockets as socketable as 99% chance dropped to ground like shit 98% sure as body armor, e.g. Ghost Armor
cube recipes #0005 add random 1-6 sockets to 22% of-all-socketable-items [weapon [axe,polearm,spear,sword]] unsocketed unlow-quality unrare unmagical unsuperior uncrafted weapon: 1 amn rune + 1 perfect amethyst + 1 ral rune + item with sockets as socketable as 99% chance dropped to ground like shit 99% sure as 9,000,000% generic [and therefore gray looking, whitish looking colored on ground armor 90% sure], e.g. Wand
cube recipes #0006 remove gems jewels runes from item socketed a priori into the item destroys gem jewel rune [desocket item]: hel rune + tp scroll + item with stuff in its sockets





[0.1% COMPLETE] LIST OF RUNEWORDS
malice  @runes = [Ith, El, Eth]
        $3_socketed_melee_weapon [ie. axe [ie. 1handed [axe], 2handed [axe]], paladin thing, polearm, spear, sword [ie. 1handed [sword], 2handed [sword]]]
        @benefits = ['-5 Life drain [per second]', '+900% physical damage [ie. eventually over time [ie. 20 minutes]]']



<TODO: convert a .d2i file into the cube location @ top-left for all item sizes>
My item code is the first one (ie. Stone of Jordan located at top-right of the [horadric] cube).

      100080006500042897e606022653d4d5f1153d90804646c04093f14ffe03
4a 4d 1000800065e40e2097e60602a936e3a9f1153d90804646c04093f14ffe03
                XX X X        XXXXXXXX

The second item code is a Stone of Jordan.d2i located at ???????


NOTICE: The 'X's mark the changes/differences[?]
</TODO>



SHIT:
-----------------
FIXME: find all of the TODO, FIXME, XXX in this repository and clear the ones [ie. delete[?] from the source/text-files/whatever] that are cleared [ie. Mission-[Already-]Accomplished [?]].
FIXME: grep 'exit' and replace with real exit code numbers [ie. for the scripts [ie. for the perl scripts] [ie. for the bash[/shell[?]] scripts]]
XXX: insertItem only inserts one item? yeah
TODO: what if I enter more than one argument for insertItem? 100% exit 1;
FIXME: are these tools too broad



pack #   7 item 7/12 total cube-space chipped pack chipped gems pack christmas001 pack
7 total gems, 'amethyst' .. 'topaz'
(in alphabetical order: [amethyst, diamond, emerald, ruby, sapphire, skull, topaz]) top left of cube, 7/12 total cube space used:
for i in 007836660702 027836760702 047836760602 207836260702 227836260602 2438b7360602 407836960702; do d2-insertItem-Alters.sh 1000a0006500$i; done; unset i


pack #   7 item full-cube christmas002 pack
ring required level 5: damage reduced by 1
ring required level 5: magic damage reduced by 1
amulet required level 6: resist cold/fire/lightning/poison by 6%
shield required level 8 required strength=75, defense=24 (XXX=needsSockets): chance to block: 64%
ring required level 9: +13 mana 92% sure on-average for-all character types
amulet required level 10 (900% new! crafted ring!!!!): +120 to attack rating, 11% life stolen per hit, +25 strength, +60 [max] life [HP]
amulet required level 13: damage reduced by 2
for i in 
100080006400642897e606022f9264782d06d10000809c035c26e0c163f11f
100080006500602897e60682674fd5c72fa598b04400528292ff
100080006500622897e606826aedcc5c300500f0c188e03f
1000800065004418d656070277a57774311500d08108e13f
100080006500042897e606821d827e33300500cc8188e03f
1000800065002418d65607829b6b6ee0310da400c0099c14382b705ae0fc07
1000800065000048f77607827ec0a7c63101805610010f0f0a9419d97f
; do
  d2-insertItem-Alters.sh $i
done; unset i


pack #   7 item full-cube christmas003 pack
boots required level 9 required strength=30: half freeze duration
amulet required level 19: damage reduced by 3
amulet required level 19: magic damage reduced by 3
belt required level 19 required strength=60: +8 strength stat
amulet required level 22: +59 [max] mana
ring required level 29: +73 [max] mana, +5 light radius
belt required level 46 required strength=50: +188 defense, 8% life stolen per hit, damage reduced by 15%, magic damage reduced by 15
for i in 
10008000650000d826460782ce4eca6b3061185b98000484144576fe07
1000800064004058c7360602372ae15ced210f90c0b00002ad0f1918f19078e081f80f
100080006500608826c6068250d901ac300100bba80006060028ff01
1000800065000418d6560702560d3adc30959b004082adff
1000800065002418d65607828fbda986300500d48188e13f
1000800065004418d656078203b9fee8310d6bf8c1029611c37f
100080006500642897e60682b323d4e730059ce04482b42c7927c37f
; do
  d2-insertItem-Alters.sh $i
done; unset i




#fresh level 1 [just created] character/toon + wanting: free + cube + full keys + filled idbook + filled tpbook + 1-30skills set + powerful/hacked charm
cd /usr/local/share/diablo-2-tools/
perl change.pl '@37make00001111' '@643make11111111' '@644make11111111' '@645make11111111' '@646make11111111' '@647make11111111' '@667make11111111' '@668make11111111' '@669make11111111' '@670make11111111' '@671make11111111' '@691make11111111' '@692make11111111' '@693make11111111' '@694make11111111' '@695make11111111' '@805make00000001' '@806make00000010' '@807make00000011' '@808make00000100' '@809make00000101' '@810make00000110' '@811make00000111' '@812make00001000' '@813make00001001' '@814make00001010' '@815make00001011' '@816make00001100' '@817make00001101' '@818make00001110' '@819make00001111' '@820make00010000' '@821make00010001' '@822make00010010' '@823make00010011' '@824make00010100' '@825make00010101' '@826make00010110' '@827make00010111' '@828make00011000' '@829make00011001' '@830make00011010' '@831make00011011' '@832make00011100' '@833make00011101' '@834make00011110'
for i in 1000800065000022f6860782251813be86e03f 100080006500009826b60682bfef6f0c831050f80f 100080006500024827b6068212193e6a830050f80f 10008000650004b856960702f06bad008380c17f 1000800064006438d61603026c25a569ed8438f0bfc4bf897fe21fc54ff1afe2aff867f15bfcbbf84c7e28ff90fe33ff95fe77fa5ff6bfd9ffff; do d2-insertItem-Alters.sh "$i"; done; unset i

