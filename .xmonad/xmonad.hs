-- Adel Khial
-- 28/11/2021

import XMonad
import qualified XMonad.StackSet as W

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.ThreeColumns

import XMonad.Hooks.ManageDocks (manageDocks)

import XMonad.Config.Azerty
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

-- Basic configuration
myTerminal = "alacritty"
myModMask = mod4Mask -- Super key
myBorderWidth = 2
myNormalBorderColor = "#a89984" -- Gray
myFocusedBorderColor = "#458588" -- Blue

-- Spawn processes
myStartupHook = do
    spawnOnce "~/.fehbg &"

-- Layouts
myLayoutHook = full ||| tall ||| column
    where
      full = smartBorders (Full)
      tall = smartSpacingWithEdge gap $ Tall nmaster delta ratio
      column = smartSpacingWithEdge gap $ ThreeCol nmaster delta (1/3)
      -- Column parameters
      gap = 5
      nmaster = 1
      delta = 3/100
      ratio = 1/2

myWorkspaces = ["web","dev","msg","4","5","6","7","8","9"]

-- Management
myManageHook = composeAll
    [ className =? "firefox" --> doShift "web"
    , className =? "Code" --> doShift "dev"
    , className =? "jetbrains-studio" --> doShift "dev"
    , className =? "TelegramDesktop" --> doShift "msg"
    , className =? "Signal" --> doShift "msg"
    , className =? "Slack" --> doShift "msg"
    , className =? "config" --> doFloat
    , className =? "dialog" --> doFloat
    , className =? "splash" --> doFloat
    , (className =? "firefox" <&&> resource =? "Dialog") --> doFloat
    ]

-- Keybindings
myKeys =
    [ ("M-S-<Return>", spawn "rofi -show drun")
    , ("M-<Return>", spawn (myTerminal))
    , ("M-S-d", spawn "(slock &) && (sleep .5 && xset dpms force off)")
    -- Audio buttons
    , ("<XF86AudioMute>", spawn "amixer set Master toggle")
    , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute")
    , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
    ]
    ++
    -- Fix screen order.
    -- See: Frequently_asked_questions#Screens_are_in_wrong_order
    [ (mask ++ "M-" ++ [key], screenWorkspace scr >>= flip whenJust (windows . action))
        | (key, scr)  <- zip "zer" [1,0,2]
        , (action, mask) <- [ (W.view, "") , (W.shift, "S-")]
    ]

-- Main
main = xmonad $ azertyConfig
    { manageHook = myManageHook <+> manageDocks
    , terminal = myTerminal
    , modMask = myModMask
    , startupHook = myStartupHook
    , layoutHook = myLayoutHook
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    } `additionalKeysP` myKeys

