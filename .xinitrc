xrdb ~/.Xresources
xset +fp ~/.fonts
xset fp rehash

setxkbmap -model pc104 -layout us,ru -option grp:alt_shift_toggle

# Hide mouse cursor
unclutter -grab -noevents -root &
# Start URxvt daemon for fast start terminal windows
urxvtd &

#exec openbox
sxhkd &
exec bspwm
