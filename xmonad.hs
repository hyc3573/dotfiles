import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Config.Kde
import XMonad.Layout.Grid
import XMonad.Layout.Spacing
import Data.Map as M
import Data.Maybe
import qualified XMonad.StackSet as W
import System.Exit
import qualified XMonad.Actions.CycleWS as CWS
import XMonad.Util.Run
import XMonad.Util.Dmenu
import XMonad.Util.Loggers
import XMonad.Hooks.EwmhDesktops
import XMonad.Prompt
import XMonad.Prompt.Window
import XMonad.Actions.Navigation2D
import XMonad.Actions.CycleWS ()
import XMonad.Layout.Renamed
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers

myManageHook = composeAll  
  [ className =? "yakuake" --> doFloat  
  , className =? "Yakuake" --> doFloat  
  , className =? "Kmix" --> doFloat  
  , className =? "kmix" --> doFloat  
  , className =? "plasma" --> doFloat  
  , className =? "Plasma" --> doFloat  
  , className =? "plasma-desktop" --> doFloat  
  , className =? "Plasma-desktop" --> doFloat  
  , className =? "krunner" --> doFloat  
  , className =? "ksplashsimple" --> doFloat  
  , className =? "ksplashqml" --> doFloat  
  , className =? "ksplashx" --> doFloat  
  , className =? "plasmashell" --> doIgnore >> doFloat >> hasBorder False
  , isKDETrayWindow --> doIgnore >> doFloat >> hasBorder False
  , className =? "pinentry-gtk-2" --> doFloat
  , className =? "ksmserver-logout-greeter" --> doIgnore
  , isDialog --> doFloat
  , isInProperty "_NET_WM_WINDOW_TYPE" "_NET_WM_WINDOW_TYPE_NOTIFICATION" --> doFloat >> doIgnore 
  ]

myLayout = lessBorders Never $ tall ||| grid ||| full ||| fullWithBar
  where tall = renamed [Replace "Tall"] $ desktopLayoutModifiers $ spacing 5 $ Tall 1 (3/100) (1/2)
        grid = renamed [Replace "Grid"] $ desktopLayoutModifiers $ spacing 5 $ Grid
        full = renamed [Replace "Full"] $ noBorders Full
        fullWithBar = renamed [ Replace "FullWB" ] $ desktopLayoutModifiers $ noBorders Full

myStartupHook = do
  spawn "picom -bc"

myKeys :: XConfig l -> Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- -- launch a terminal
    -- [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- -- launch dmenu
    -- , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")

    -- -- launch gmrun
    -- , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")

    -- -- close focused window
    -- , ((modm .|. shiftMask, xK_c     ), kill)

    --  -- Rotate through the available layout algorithms
    -- , ((modm,               xK_space ), sendMessage NextLayout)

    -- --  Reset the layouts on the current workspace to default
    -- , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- -- Resize viewed windows to the correct size
    -- , ((modm,               xK_n     ), refresh)

    -- -- Move focus to the next window
    -- , ((modm,               xK_Tab   ), windows W.focusDown)

    -- -- Move focus to the next window
    -- , ((modm,               xK_j     ), windows W.focusDown)

    -- -- Move focus to the previous window
    -- , ((modm,               xK_k     ), windows W.focusUp  )

    -- -- Move focus to the master window
    -- , ((modm,               xK_m     ), windows W.focusMaster  )

    -- -- Swap the focused window and the master window
    -- , ((modm,               xK_Return), windows W.swapMaster)

    -- -- Swap the focused window with the next window
    -- , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- -- Swap the focused window with the previous window
    -- , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- -- Shrink the master area
    -- , ((modm,               xK_h     ), sendMessage Shrink)

    -- -- Expand the master area
    -- , ((modm,               xK_l     ), sendMessage Expand)

    -- -- Push window back into tiling
    -- , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- -- Increment the number of windows in the master area
    -- , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- -- Deincrement the number of windows in the master area
    -- , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- -- Toggle the status bar gap
    -- -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- -- See also the statusBar function from Hooks.DynamicLog.
    -- --
    -- -- , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- -- Quit xmonad
    -- , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- -- Restart xmonad
    -- , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    -- ]
    -- ++

    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

myWorkspaces = ["1", "2", "3", "4", "SP"]

main :: IO()
main = xmonad $ kdeConfig
    { modMask = mod4Mask
    , manageHook = manageHook kdeConfig <+> myManageHook
    , terminal = "wezterm"
    , borderWidth = 1
    , normalBorderColor = "#2e3440"
    , focusedBorderColor = "#81a1c1"
    , layoutHook = myLayout
    , startupHook = myStartupHook
    , XMonad.keys = myKeys
    , workspaces = myWorkspaces
    }
  `additionalKeysP`
    [ ("M-S-r", spawn "xmonad --recompile; xmonad --restart")
    , ("M-S-<Space>", withFocused $ windows . W.sink)
    , ("M-<Space>", spawn "wmctrl -iR `wmctrl -l | rofi -dmenu -p \"window\" | awk '{ print $1 }'`")
    , ("M-f t", sendMessage $ JumpToLayout "Tall")
    , ("M-f f", sendMessage $ JumpToLayout "Full")
    , ("M-f g", sendMessage $ JumpToLayout "Grid")
    , ("M-f m", sendMessage $ JumpToLayout "FullWB")
    , ("M-S-q", kill)
    , ("M-S-e", spawn "qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1")
    , ("M-a", windows W.focusUp)
    , ("M-d", windows W.focusDown)
    , ("M-w", windows W.focusMaster)
    , ("M-S-a", windows W.swapUp)
    , ("M-S-d", windows W.swapDown)
    , ("M-S-w", windows W.swapMaster)
    , ("M-C-s", sendMessage Shrink)
    , ("M-C-e", sendMessage Expand)
    , ("M-S-c", windows $ W.shift "SP")
    , ("M-c", windows $ W.view "SP")
    , ("M-x g g", spawn "~/.config/i3/scripts/ocr.sh")
    , ("M-x g r", spawn "~/.config/i3/scripts/ocr_trans.sh")
    , ("M-x q", spawn "~/.config/i3/scripts/quickrunner.sh")
    , ("M-x x", spawn "rofi -show drun -show-icons" )
    , ("M-x c", spawn "rofi -show calc -modi calc -no-show-match -no-sort")
    , ("M-x b", spawn "brave")
    , ("M-x d", spawn "dolphin")
    , ("M-x e", spawn "emacsclient -c")
    , ("M-x m", spawn "multimc")
    , ("M-x s", spawn "systemsettings5")
    , ("M-x t", spawn "wezterm")
    , ("M-x h", spawn "multimc -l 1.8.9")
    , ("M-v", screenWorkspace 0 >>= flip whenJust (windows . W.view))
    , ("M-b", screenWorkspace 1 >>= flip whenJust (windows . W.view))
    , ("M-S-v", screenWorkspace 0 >>= flip whenJust (windows . s W.view W.shift))
    , ("M-S-b", screenWorkspace 1 >>= flip whenJust (windows . s W.view W.shift))
    ]
  where
    s a b c = a c . b c
