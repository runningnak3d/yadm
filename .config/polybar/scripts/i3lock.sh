#!/bin/bash

rectangles=" "

SR=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
for RES in $SR; do
  SRA=(${RES//[x+]/ })
  CX=$((${SRA[2]} + 25))
  CY=$((${SRA[1]} - 30))
  rectangles+="rectangle $CX,$CY $((CX+300)),$((CY-80)) "
done

#icon=$HOME/Downloads/Xomu.jpg
tmpbg=/tmp/screen.png
#scrot $tmpbg && convert $tmpbg -scale 10% -scale 1000% -draw "fill black fill-opacity 0.6 $rectangles" $tmpbg
#convert $tmpbg $icon -gravity center -composite -matte $tmpbg

config=/home/swango/.config
tmpbg="$HOME/.local/share/backgrounds/default.png"
tmpbg_edited="$HOME/.cache/lockscreen_wallpaper_edited.jpg"

# if there is not edited picture then, first resize and add rectangle
if [ ! -f $tmpbg_edited ]; then
	res=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
	convert "$tmpbg" -resize "$res""^" -gravity center -extent "$res" "$tmpbg_edited"
	convert $tmpbg_edited -draw "fill black fill-opacity 0.6 $rectangles" $tmpbg_edited
fi

insidecolor=00000000
ringcolor=ffffffff
keyhlcolor=d23c3dff
bshlcolor=d23c3dff
separatorcolor=00000000
insidevercolor=00000000
insidewrongcolor=d23c3dff
ringvercolor=ffffffff
ringwrongcolor=ffffffff
verifcolor=ffffffff
timecolor=ffffffff
datecolor=ffffffff
loginbox=00000066
locktext=''
font='Iosevka'

i3lock -i $tmpbg_edited \
		--time-pos='x+1280:h-720' \
		--date-pos='x+1280:h-740' \
		--clock --date-align 1 --date-str "$locktext" \
		--inside-color=$insidecolor --ring-color=$ringcolor --line-uses-inside \
		--keyhl-color=$keyhlcolor --bshl-color=$bshlcolor --separator-color=$separatorcolor \
		--insidever-color=$insidevercolor --insidewrong-color=$insidewrongcolor \
		--ringver-color=$ringvercolor --ringwrong-color=$ringwrongcolor --ind-pos='x+280:h-70' \
		--radius=20 --ring-width=4 --verif-text='' --wrong-text='' \
		--verif-color="$verifcolor" --time-color="$timecolor" --date-color="$datecolor" \
		--noinput-text='' --force-clock $lockargs --time-font=$font --date-font=$font \
		--date-size=16 --pass-media-keys

# take screenshot of lockscreen
# sleep 2
# maim ~/Pictures/Screenshots/Screenshot_from_`date +%Y-%m-%d_%H-%M-%S`.png
rm -f $tmpbg_edited
