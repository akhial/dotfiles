-- Adel Khial

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (manageDocks)
import XMonad.Hooks.SetWMName

import XMonad.Config.Azerty
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

-- Basic configuration
myTerminal           = "alacritty"
myModMask            = mod4Mask -- Super key
myBorderWidth        = 2
myNormalBorderColor  = "#a89984" -- Gray
myFocusedBorderColor = "#458588" -- Blue

-- Spawn processes
myStartupHook = do
    spawnOnce "~/bin/fehbg &"
    spawnOnce "xsetroot -cursor_name left_ptr"
    spawnOnce "dunst &"
    setWMName "LG3D"

-- Layouts
myLayoutHook = full ||| tall
    where
      full    = lessBorders EmptyScreen (Full)
      tall    = smartSpacingWithEdge gap $ Tall nmaster delta ratio
      column  = smartSpacingWithEdge gap $ ThreeCol nmaster delta (1/3)
      -- Column parameters
      gap     = 5
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
    , className =? "dialog"           --> doFloat
    , className =? "splash"           --> doFloat
    ]

-- Keybindings
myKeys =
    [ ("M-S-<Return>",            spawn "rofi -show drun")
    , ("M-C-<Return>",            spawn "rofi -show window")
    , ("M-<Return>",              spawn (myTerminal))
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
        | (key, scr)  <- zip "zer" [1,0,2]
        , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
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
