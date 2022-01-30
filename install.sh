#!/bin/sh

mv $HOME/.emacs.d/init.el $HOME/.emacs.d/init.el.orig
mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.orig

for FILE in `ls -a -I .git -I . -I .. -I init.el -I config.fish -I install.sh -I README.md -I README.org -I xmonad.hs -I wezterm.lua -I bindings -I config -I config.ini -I mpd.conf -I scimrc -I picom.conf`
do
	mv $HOME/$FILE $HOME/$FILE.orig
done

ln -s `pwd`/init.el $HOME/.emacs.d/init.el
ln -s `pwd`/config.fish $HOME/.config/fish/config.fish
ln -s `pwd`/wezterm.lua $HOME/.config/wezterm/wezterm.lua
ln -s `pwd`/xmonad.hs $HOME/.config/xmonad/xmonad.hs
ln -s `pwd`/picom.conf $HOME/.config/picom.conf

ln -s `pwd`/bindings $HOME/.config/ncmpcpp/bindings
ln -s `pwd`/config $HOME/.config/ncmpcpp/config
ln -s `pwd`/config.ini $HOME/.config/polybar/config.ini
ln -s `pwd`/mpd.conf $HOME/.config/mpd/mpd.conf
ln -s `pwd`/scimrc $HOME/.config/sc-im/scimrc

for FILE in `ls -a -I .git -I . -I .. -I init.el -I config.fish -I install.sh -I README.md -I README.org -I xmonad.hs -I wezterm.lua -I bindings -I config -I config.ini -I mpd.conf -I scimrc -I picom.conf`
do
	ln -s `pwd`/$FILE $HOME/$FILE
done

xrdb -merge ~/.Xresources
