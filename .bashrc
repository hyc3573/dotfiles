#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vim='nvim'
alias emacs='emacs -nw'

PS1='[\u@\h \W]\$ '
alias rm='rm -i'
