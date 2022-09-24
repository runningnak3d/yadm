#!/bin/sh
export WINDOW=$(xprop -id $(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | cut -f 2) WM_CLASS | awk '{ print $4}' | sed 's/"//g')

case $WINDOW in
	Pidgin) zenity --text-info --filename=$HOME/.config/i3/scripts/cheatsheets/chrome.cheat --width=800 --height=600; ;;
	kitty) zenity --text-info --filename=$HOME/.config/i3/scripts/cheatsheets/kitty.cheat --width=800 --height=600; ;;
		*) echo exit; ;;
esac
