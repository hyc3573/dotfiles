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
import XMonad.Layout.WindowNavigation
import XMonad.Layout.SubLayouts
import XMonad.Layout.BoringWindows
import HscTypes (Usage(UsageMergedRequirement))
import XMonad.Layout.Fullscreen
import XMonad.Layout.IndependentScreens
import XMonad.Layout.WindowNavigation (windowNavigation)
import Data.List as L
import qualified XMonad.StackSet as SS
import Data.Monoid (All (All))
import Foreign.C (CInt)
import Control.Monad (when)
import Data.Foldable (find)
import XMonad.Actions.UpdateFocus
import qualified XMonad.Config.Dmwit (withScreen)
import qualified XMonad.Config.Dmwit (viewShift)
import XMonad.Actions.OnScreen (onlyOnScreen)
import XMonad.Actions.Warp (warpToWindow)
import XMonad.Hooks.ManageDocks (avoidStruts)
import XMonad.Layout.Minimize
import XMonad.Actions.Minimize
import XMonad.Layout.BoringWindows as BW
import XMonad.Actions.WindowBringer as WBR
import XMonad.Util.WorkspaceCompare
import XMonad.StackSet (greedyView)
import XMonad.Layout.ResizableTile

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
  , className =? "GL" --> doFloat
  , className ~? "gnome-pie" --> hasBorder False
  , isFullscreen --> hasBorder False
  ]
  where
   q ~? x = fmap (x `L.isInfixOf`) q

myLayout = lessBorders Never $ minimize $ BW.boringWindows $ tall ||| grid ||| full ||| fullWithBar
  where tall = renamed [XMonad.Layout.Renamed.Replace "Tall"] $ avoidStruts $ spacing 10 $ ResizableTall 1 (3/100) (1/2) []
        grid = renamed [XMonad.Layout.Renamed.Replace "Grid"] $ avoidStruts $ spacing 10 Grid
        full = renamed [XMonad.Layout.Renamed.Replace "Full"] $ windowNavigation $ subLayout [] subTall $ noBorders Full
        fullWithBar = renamed [XMonad.Layout.Renamed.Replace "FullWB" ] $ avoidStruts $ windowNavigation $ subLayout [] subTall $ noBorders Full
        subTall = Tall 1 (3/100) (1/2)

myStartupHook = do
  spawn "picom -bc"
  spawn "sleep 1; ~/.config/polybar/launch.sh"
  spawn "setxkbmap -option caps:escape"
  modify $ \xstate -> xstate { windowset = onlyOnScreen 1 "1_1" (windowset xstate) }

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
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

multiScreenFocusHook :: Event -> X All
multiScreenFocusHook MotionEvent { ev_x = x, ev_y = y } = do
  -- focusScreenForPos x y
  io (appendFile "/home/yuchan/.log/xmonad.log" (show x ++ " " ++ show y ++ "\n"))
  return (All True)
  where focusScreenForPos :: CInt -> CInt
            -> X ()
        focusScreenForPos x y
          | x <= 1920 = windows $ withWspOnScreen 0 W.view
          | otherwise = windows $ withWspOnScreen 1 W.view
multiScreenFocusHook _ = return (All True)
  
main :: IO()
main = xmonad $ fullscreenSupportBorder $ ewmh $ kdeConfig
    { modMask = mod4Mask
    , manageHook = manageHook kdeConfig <+> myManageHook
    , terminal = "wezterm"
    , borderWidth = 1
    , normalBorderColor = "#2e3440"
    , focusedBorderColor = "#81a1c1"
    , layoutHook = myLayout
    , startupHook = myStartupHook
    , XMonad.keys = myKeys
    , workspaces = withScreens 2 ["1", "2", "3", "4"]
    -- , handleEventHook = handleEventHook kdeConfig <+> multiScreenFocusHook
    -- , rootMask = rootMask kdeConfig .|. pointerMotionMask
    -- , clientMask = clientMask kdeConfig .|. pointerMotionMask
    }
  `additionalKeysP`
    [ ("M-S-r", spawn "xmonad --recompile && xmonad --restart && notify-send XMonad Restarted! || notify-send XMonad Failed!")
    , ("M-S-<Space>", withFocused $ windows . W.sink)
    -- , ("M-<Space>", spawn "wmctrl -iR `wmctrl -l | rofi -dmenu -p \"window\" | awk '{ print $1 }'`")
    , ("M-<Space>", do c <- windowMap' def
                       win <- menuMapArgs "rofi" ["-dmenu", "-p 'window'"] c
                       whenJust win maximizeWindow
                       whenJust win (windows . bringWindow)
                       whenJust win focus
                       centerMouse)
    , ("M-f t", sendMessage $ JumpToLayout "Tall")
    , ("M-f f", sendMessage $ JumpToLayout "Full")
    , ("M-f g", sendMessage $ JumpToLayout "Grid")
    , ("M-f w", sendMessage $ JumpToLayout "FullWB")
    , ("M-S-q", kill)
    , ("M-S-e", spawn "qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1")
    , ("M-a", BW.focusUp)
    , ("M-d", BW.focusDown)
    , ("M-w", BW.focusMaster)
    , ("M-S-a", windows W.swapUp)
    , ("M-S-d", windows W.swapDown)
    , ("M-S-w", windows W.swapMaster)
    , ("M-C-s", sendMessage MirrorShrink)
    , ("M-C-w", sendMessage MirrorExpand)
    , ("M-C-a", sendMessage Shrink)
    , ("M-C-d", sendMessage Expand)
    , ("M-S-c", withFocused minimizeWindow)
    , ("M-x g g", spawn "~/.config/i3/scripts/ocr.sh")
    , ("M-x g r", spawn "~/.config/i3/scripts/ocr_trans.sh")
    , ("M-x x", spawn "rofi -show drun -show-icons" )
    , ("M-x c", spawn "rofi -show calc -modi calc -no-show-match -no-sort")
    , ("M-x b", spawn "brave")
    , ("M-x d", spawn "dolphin")
    , ("M-x e", spawn "emacsclient -c")
    , ("M-x m", spawn "multimc")
    , ("M-x s", spawn "systemsettings5")
    , ("M-x t", spawn "wezterm")
    , ("M-x h", spawn "multimc -l 1.8.9")
    , ("M-v", do
          windows $ withWspOnScreen 0 W.view
          centerMouse)
    , ("M-b", do
          windows $ withWspOnScreen 1 W.view
          centerMouse)
    , ("M-S-v", windows (withWspOnScreen 0 (s W.view W.shift)) >> centerMouse) 
    , ("M-S-b", windows (withWspOnScreen 1 (s W.view W.shift)) >> centerMouse)
    , ("M-m a", withFocused (sendMessage . mergeDir W.focusUp'))
    , ("M-m d", withFocused (sendMessage . mergeDir W.focusUp'))
    , ("M-m u", withFocused (sendMessage . UnMerge))
    , ("M-s d", do ws <- wsBy 1
                   let vws = unmarshallW ws
                   windows $ onCurrentScreen W.greedyView vws)
    , ("M-s a", do ws <- wsBy (-1)
                   let vws = unmarshallW ws
                   windows $ onCurrentScreen W.greedyView vws)
    ]
  where
    s a b c = a c . b c
    onScreen id f vws ws = f (marshall id vws) ws
    centerMouse = warpToWindow (1/2) (1/2)
    wsBy = CWS.findWorkspace getSortByIndex Next CWS.anyWS
