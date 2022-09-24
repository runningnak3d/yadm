#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

#if ! updates_aur=$(pacman -Syyuu 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates_aur=$(rua upgrade --printonly 2> /dev/null | wc -l); then
    updates_aur=0
fi

#if ! updates_void=$(xbps-install -un | cut -d' ' -f2 | sort | uniq -c | xargs | cut -d" " -f1); then
#	updates_void=0
#fi

#if ! updates_gentoo=$(sudo emaint sync -a 2>&1 > /dev/null && emerge -uDNp --with-bdeps y @system @world | tail -n +5 | wc -l); then
#	updates_gentoo=0
#fi

#if ! updates_devuan=$(apt update | grep packages | tail -n +1 | cut -d" " -f1); then
#	updates_devuan=0
#fi

updates=$(("$updates_arch" + "$updates_aur"))

#export updates = $updates_gentoo

if [ "$updates_arch" -gt 0 ]; then
    echo "%{T4}%{T-}  $updates"
else
    echo "%{T4}%{T-}  $updates"
fi
