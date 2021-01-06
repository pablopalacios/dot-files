import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.NoBorders
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig (additionalKeysP)

wsTerm = "1"
wsCode = "2"
wsWeb = "3"
wsDocs = "4"
wsMail = "5"
wsMusic = "6"
wsMisc = "7"

myManageHook = composeAll [ className =? "Chromium" --> doF (W.shift wsWeb)
                          , className =? "Emacs" --> doF (W.shift wsCode)
                          , className =? "Evince" --> doF (W.shift wsDocs)
                          , className =? "Google-chrome" --> doF (W.shift wsWeb)
                          , className =? "Org.gnome.Nautilus" --> doF (W.shift wsDocs)
                          , className =? "Thunderbird" --> doF (W.shift wsMail)
                          , className =? "Zeal" --> doF (W.shift wsDocs)
                          , className =? "firefox" --> doF (W.shift wsWeb)
                          , className =? "libreoffice-calc" --> doF (W.shift wsDocs)
                          , className =? "libreoffice-startcenter" --> doF (W.shift wsDocs)
                          , className =? "libreoffice-writer" --> doF (W.shift wsDocs)
                          ]

myLayoutHook = smartBorders $ Mirror tiled ||| tiled ||| Full
  where
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 3/5
    delta   = 3/100

myConfig = ewmh def { borderWidth = 3
                    , clickJustFocuses = False
                    , focusFollowsMouse = False
                    , focusedBorderColor = "#f92672"
                    , handleEventHook = handleEventHook def <+> fullscreenEventHook
                    , layoutHook = myLayoutHook
                    , manageHook = manageHook def <+> myManageHook
                    , modMask = mod4Mask
                    , normalBorderColor = "#383830"
                    , terminal = "termite"
                    , workspaces = [wsTerm, wsCode, wsWeb, wsDocs, wsMail, wsMusic, wsMisc]
                    }
           `additionalKeysP`
           [ ("M-p", spawn "dmenu_run -fn 'monospace-9' -nb '#272822' -nf '#f8f8f2' -sb '#f92672' -sf '#f8f8f2'")
           , ("<XF86MonBrightnessDown>", spawn "brightnessctl -d intel_backlight set 3%-")
           , ("<XF86MonBrightnessUp>", spawn "brightnessctl -d intel_backlight set +3%")
           , ("<XF86AudioLowerVolume>", spawn "pamixer -d 10")
           , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 10")
           , ("<XF86AudioMute>", spawn "pamixer -t")
           , ("<XF86Display>", spawn "autorandr -c")
           ]

main = xmonad =<< xmobar myConfig
