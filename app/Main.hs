import StatusBar (sbConfig)
import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Magnifier
import XMonad.Layout.ThreeColumns
import XMonad.Util.EZConfig

main :: IO ()
main =
  xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB (sbConfig) defToggleStrutsKey
    $ myConfig

myConfig :: XConfig (Choose Tall (Choose (Mirror Tall) (Choose Full (ModifiedLayout Magnifier ThreeCol))))
myConfig =
  def
    { modMask = mod4Mask,
      layoutHook = myLayout,
      manageHook = myManageHook,
      terminal = "alacritty"
    }
    `additionalKeysP` [ ("M-S-z", spawn "xscreensaver-command -lock"),
                        ("M-C-s", unGrab *> spawn "scrot -s"),
                        ("M-f", spawn "firefox")
                      ]

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat,
      isDialog --> doFloat
    ]

myLayout :: Choose Tall (Choose (Mirror Tall) (Choose Full (ModifiedLayout Magnifier ThreeCol))) a
myLayout = tiled ||| Mirror tiled ||| Full ||| threeCol
  where
    threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1 / 2
    delta = 3 / 100
