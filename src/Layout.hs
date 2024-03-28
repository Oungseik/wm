module Layout (myLayout) where

import XMonad
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns

myLayout :: Choose Tall (Choose (Mirror Tall) (Choose Full (ModifiedLayout Magnifier ThreeCol))) a
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100
