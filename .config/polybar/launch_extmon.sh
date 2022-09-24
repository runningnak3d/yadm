if type "xrandr"; then
#  for m in $(xrandr --query | grep " connected" | grep -v eDP-1 | cut -d" " -f1); do
  for m in $(xrandr --query | grep " connected" | grep eDP-1 | cut -d" " -f1); do
    EXTMONITOR=$m polybar --reload extmon &
  done
else
  polybar --reload extmon &
fi
