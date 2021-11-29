-- Adel Khial's XMonad config
-- 28/11/2021

import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig (additionalKeysP)

-- Basic configuration
myTerminal = "alacritty"
myModMask = mod4Mask -- Super key
myBorderWidth = 2
myNormalBorderColor = "#a89984" -- Gray
myFocusedBorderColor = "#458588" -- Blue

-- Keybindings
myKeys :: [(String, X ())]
myKeys =
    [ ("M-S-<Return>", spawn "rofi -show drun")
    , ("M-<Return>", spawn (myTerminal))
    , ("M-S-z", spawn "xset dpms force off && slock")
    ]

main = xmonad $ desktopConfig
    { terminal = myTerminal
    , modMask = myModMask
    , borderWidth = myBorderWidth
    , normalBorderColor = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    }
    `additionalKeysP` myKeys
