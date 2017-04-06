firefox &
sh ~/.fehbg &
xrdb -merge -I$HOME ~/.Xresources
urxvt &
zeal &
emacs --daemon &
thunderbird &
exec dbus-launch xmonad
