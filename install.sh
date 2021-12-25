#!/bin/sh

mv $HOME/.emacs.d/init.el $HOME/.emacs.d/init.el.orig
mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.orig

for FILE in `ls -a -I .git -I . -I .. -I init.el -I config.fish -I install.sh -I README.md -I README.org -I xmonad.hs -I wezterm.lua`
do
	mv $HOME/$FILE $HOME/$FILE.orig
done

ln -s `pwd`/init.el $HOME/.emacs.d/init.el
ln -s `pwd`/config.fish $HOME/.config/fish/config.fish
ln -s `pwd`/wezterm.lua $HOME/.config/wezterm/wezterm.lua
ln -s `pwd`/xmonad.hs $HOME/.config/xmonad/xmonad.hs

for FILE in `ls -a -I .git -I . -I .. -I init.el -I config.fish -I install.sh -I README.md -I README.org -I xmonad.hs -I wezterm.lua`
do
	ln -s `pwd`/$FILE $HOME/$FILE
done
