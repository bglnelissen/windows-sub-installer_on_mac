#!/bin/bash
# does not work for me yet.
# b.nelissen
# i used my linux server using this command:
# bas@mini:~$ sudo woeusb --device /home/bas/win10/Win10_22H2_EnglishInternational_x64v1.iso /dev/sdc --target-filesystem ntfs

brew install wimlib 
diskutil list
diskutil eraseDisk MS-DOS "WIN10" GPT /dev/disk4
hdiutil mount ./Win10_22H2_EnglishInternational_x64v1.iso
rsync -vha --exclude=sources/install.wim "/Volumes/CCCOMA_X64FRE_EN-GB_DV9/" /Volumes/WIN10 
wimlib-imagex split /Volumes/CCCOMA_X64FRE_EN-GB_DV9/sources/install.wim /Volumes/WIN10/sources/install.swm 3800
diskutil eject /dev/disk4
diskutil eject /dev/disk14
