module Keybindings (myKeyBind) where

import XMonad (X, spawn, unGrab)

myKeyBind :: [(String, X ())]
myKeyBind =
  [ ("M-S-z", spawn "xscreensaver-command -lock"),
    ("M-C-s", unGrab *> spawn "scrot -s"),
    ("M-f", spawn "firefox")
  ]
