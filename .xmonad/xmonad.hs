import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.NoBorders
import XMonad.Util.WorkspaceCompare

import Data.Monoid
import System.Exit
import Text.Printf

import qualified XMonad.StackSet as W
import qualified Data.Map        as M


-- Theme
font = "Source Code Pro-9:Bold"
color00 = "#272822"
color01 = "#383830"
color02 = "#49483e"
color03 = "#75715e"
color04 = "#a59f85"
color05 = "#f8f8f2"
color06 = "#f5f4f1"
color07 = "#f9f8f5"
color08 = "#f92672"
color09 = "#fd971f"
color0A = "#f4bf75"
color0B = "#a6e22e"
color0C = "#a1efe4"
color0D = "#66d9ef"
color0E = "#ae81ff"
color0F = "#cc6633"

-- Programs
myTerminal = "urxvt"

dmenu_cmd = "dmenu_run -nb '%s' -nf '%s' -sb '%s' -fn '%s'"
myMenu = printf dmenu_cmd color02 color04 color0F font

-- Workspaces
wsTerm = "\xf120"
wsCode = "\xf121"
wsWeb = "\xf269"
wsDocs = "\xf07b"
wsMail = "\xf0e0"
wsMusic = "\xf001"
wsMisc = "\xf00a"

myWorkspaces = [wsTerm, wsCode, wsWeb, wsDocs, wsMail, wsMusic, wsMisc]

-- Borders
myBorderWidth = 3
myNormalBorderColor  = color01
myFocusedBorderColor = color0F

-- Key bindings
myModMask = mod4Mask
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch menu
    , ((modm, xK_p), spawn myMenu)

    -- close focused window
    , ((modm .|. shiftMask, xK_c), kill)

    -- Rotate through the available layout algorithms
    , ((modm, xK_space), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm, xK_n), refresh)

    -- Move focus to the next window
    , ((modm, xK_Tab), windows W.focusDown)

    -- Move focus to the next window
    , ((modm, xK_j), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm, xK_k), windows W.focusUp)

    -- Move focus to the master window
    , ((modm, xK_m), windows W.focusMaster)

    -- Swap the focused window and the master window
    , ((modm, xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)

    -- Shrink the master area
    , ((modm, xK_h), sendMessage Shrink)

    -- Expand the master area
    , ((modm, xK_l), sendMessage Expand)

    -- Push window back into tiling
    , ((modm, xK_t), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm, xK_comma), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm, xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm, xK_b), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++

    -- Workspaces
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_7]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    -- Screens
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

-- Mouse bindings
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Layouts:
myLayout = tiled ||| Mirror tiled ||| noBorders Full
  where
     -- default tiling algorithm partitions the screen into two panes
     tiled   = Tall nmaster delta ratio
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 3/5
     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

-- Window rules
myManageHook = composeAll
    [ className =? "Emacs"              --> doF (W.shift wsCode)
    , className =? "Firefox"            --> doF (W.shift wsWeb)
    , className =? "libreoffice-writer" --> doF (W.shift wsDocs)
    , className =? "libreoffice-calc"   --> doF (W.shift wsDocs)
    , className =? "Evince"             --> doF (W.shift wsDocs)
    , className =? "Nautilus"           --> doF (W.shift wsDocs)
    , className =? "Zeal"               --> doF (W.shift wsDocs)
    , className =? "Thunderbird"        --> doF (W.shift wsMail)
    ]

-- Event handling
myEventHook = fullscreenEventHook

-- Status bars and logging
myLogHook = return ()

-- Startup hook
myStartupHook = return ()

-- Xmobar
myBar = "xmobar"
myPP = PP { ppCurrent = xmobarColor color0F ""
          , ppVisible = wrap "<" ">"
          , ppHidden = xmobarColor color03 ""
          , ppHiddenNoWindows = const ""
          , ppUrgent = wrap "(" ")"
          , ppSep = " "
          , ppWsSep = " "
          , ppTitle = shorten 50
          , ppTitleSanitize = xmobarStrip . dzenEscape
          , ppLayout = const ""
          , ppOrder = id
          , ppOutput = putStrLn
          , ppSort = getSortByIndex
          , ppExtras = []
          }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Xmonad
defaults = def {
        -- simple stuff
        terminal = myTerminal,
        focusFollowsMouse = myFocusFollowsMouse,
        clickJustFocuses = myClickJustFocuses,
        borderWidth = myBorderWidth,
        modMask = myModMask,
        workspaces = myWorkspaces,
        normalBorderColor = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        -- key bindings
        keys = myKeys,
        mouseBindings = myMouseBindings,
        -- hooks, layouts
        layoutHook = myLayout,
        manageHook = myManageHook,
        handleEventHook = myEventHook,
        logHook = myLogHook,
        startupHook = myStartupHook
        }

main = xmonad =<< statusBar myBar myPP toggleStrutsKey defaults
