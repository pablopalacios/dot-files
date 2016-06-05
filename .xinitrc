sh ~/.fehbg &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
exec urxvt &
exec zeal &
exec emacs &
exec skype &
exec thunderbird &
exec firefox &
xrandr --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 1920x0 --rotate normal --output VIRTUAL1 --off --output DP1 --off --output VGA1 --primary --mode 1920x1080 --pos 0x0 --rotate normal
exec dbus-launch xmonad
