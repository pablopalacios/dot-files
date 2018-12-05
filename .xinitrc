xrdb -merge -I$HOME ~/.Xresources
bash ~/.screenlayout/big.sh
exec urxvt &
exec firefox &
exec zeal &
exec thunderbird &
exec dbus-launch xmonad
