import Keybindings (myKeyBind)
import Layout (myLayout)
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
    `additionalKeysP` myKeyBind

myManageHook :: ManageHook
myManageHook =
  composeAll
    [ className =? "Gimp" --> doFloat,
      isDialog --> doFloat
    ]
