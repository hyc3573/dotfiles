# set guifont=MesloLGS\ NF\ 12

highlight Cursor guifg=black guibg=white
highlight iCursor guibg=white
set guicursor=n-c:block-Cursor
set guicursor+=i:ver5-iCursor
set guicursor+=v:hor1-iCursor
set guicursor+=n-c:blinkon0


tmenu icon=/usr/share/icons/breeze-dark/actions/16/media-playback-start.svg 1.46 ToolBar.BuildAndRun 빌드 및 실행
amenu ToolBar.BuildAndRun <Esc><Esc>:AsyncTask build_and_run<cr>

tmenu icon=/usr/share/icons/breeze-dark/actions/16/run-build.svg 1.46 ToolBar.Build 빌드
amenu ToolBar.Build <Esc><Esc>:AsyncTask build<cr>

tmenu icon=/usr/share/icons/breeze-dark/actions/16/debug-run.svg 1.47 ToolBar.BuildAndDebug 빌드 및 디버그
amenu ToolBar.BuildAndDebug <Esc><Esc>:AsyncTask build_and_debug<cr>

tmenu icon=/usr/share/icons/breeze-dark/actions/16/debug-run.svg 1.48 ToolBar.Debug 디버그
amenu ToolBar.Debug <Esc><Esc>:AsyncTask debug<cr>


amenu 1.49 ToolBar.-sep8- <Nop>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

set lines=999 columns=999

echo 'asdf'
