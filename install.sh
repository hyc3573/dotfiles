#!/bin/sh

mv $HOME/.emacs.d/init.el $HOME/.emacs.d/init.el.orig
mv $HOME/.config/fish/config.fish $HOME/.config/fish/config.fish.orig

for FILE in `ls -a -I .git -I . -I .. -I init.el -I config.fish -I install.sh`
do
	mv $HOME/$FILE $HOME/$FILE.orig
done

ln -s `pwd`/init.el $HOME/.emacs.d/init.el
ln -s `pwd`/config.fish $HOME/.config/fish/config.fish

for FILE in `ls -a -I .git -I . -I .. -I init.el -I config.fish -I install.sh`
do
	ln -s `pwd`/$FILE $HOME/$FILE
done
