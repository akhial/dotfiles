-- Adel Khial

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName

import XMonad.Config.Azerty
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run
import XMonad.Util.SpawnOnce

-- Theme colors
colorfg = "#ebdbb2"
colorbg = "#282828"
color01 = "#cc241d"
color02 = "#98971a"
color03 = "#d79921"
color04 = "#458588"
color05 = "#b16286"
color06 = "#689d6a"
color07 = "#a89984"
color08 = "#928374"

-- Basic configuration
myTerminal           = "alacritty"
myBrowser            = "qutebrowser"
myModMask            = mod4Mask -- Super key
myBorderWidth        = 2
myNormalBorderColor  = color07 -- Gray
myFocusedBorderColor = color04 -- Blue

-- Spawn processes
myStartupHook = do
    spawnOnce "~/bin/fehbg &"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "dunst &"
    setWMName "LG3D"

-- Spacing
mySpacing = spacingRaw True (Border gap gap gap gap) True (Border gap gap gap gap) True
    where
      gap = 4

-- Layouts
myLayoutHook = full ||| tall ||| nb
    where
      full    = lessBorders EmptyScreen (Full)
      nb      = noBorders (Full)
      tall    = mySpacing $ Tall nmaster delta ratio
      column  = mySpacing $ ThreeCol nmaster delta (1/3)
      -- Column parameters
      nmaster = 1
      delta   = 3/100
      ratio   = 1/2

-- Management
myManageHook = composeAll
    [ className =? "Code"             --> doShift "2"
    , className =? "jetbrains-studio" --> doShift "2"
    , className =? "TelegramDesktop"  --> doShift "5"
    , className =? "Signal"           --> doShift "5"
    , className =? "Slack"            --> doShift "5"
    , className =? "config"           --> doFloat
    , className =? "confirm"          --> doFloat
    , className =? "dialog"           --> doFloat
    , className =? "file_progress"    --> doFloat
    , className =? "error"            --> doFloat
    , className =? "notification"     --> doFloat
    , className =? "splash"           --> doFloat
    , className =? "toolbar"          --> doFloat
    , className =? "Gcolor3"          --> doFloat
    , className =? "Galculator"       --> doFloat
    ]

-- Keybindings
myKeys =
    [ ("M-S-<Return>",            spawn "rofi -show drun")
    , ("M-C-<Return>",            spawn "rofi -show window")
    , ("M-<Return>",              spawn myTerminal)
    , ("M-b",                     spawn myBrowser)
    , ("M-S-x",                   spawn "(slock &) && (sleep .5 && xset dpms force off)")
    -- Hardware buttons
    , ("<XF86AudioMute>",         spawn "amixer set Master toggle")
    , ("<XF86AudioLowerVolume>",  spawn "amixer set Master 5%- unmute")
    , ("<XF86AudioRaiseVolume>",  spawn "amixer set Master 5%+ unmute")
    , ("<XF86MonBrightnessUp>",   spawn "xbacklight -inc 10")
    , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
    , ("<Print>",                 spawn "~/bin/shot")
    ]
    ++
    -- Fix screen order.
    -- See: Frequently_asked_questions#Screens_are_in_wrong_order
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
        | (key, scr)  <- zip "wer" [1,0,2]
        , (action, mask) <- [ (W.view, ""), (W.shift, "S-") ]
    ]

-- Main
main = xmonad $ ewmh azertyConfig
    { manageHook         = myManageHook <+> manageDocks
    , terminal           = myTerminal
    , modMask            = myModMask
    , startupHook        = myStartupHook
    , layoutHook         = myLayoutHook
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    } `additionalKeysP` myKeys
