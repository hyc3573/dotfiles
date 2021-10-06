neofetch
echo ""

source ~/git/znap/zsh-snap/znap.zsh

# znap source powerlevel10k
znap source marlonrichert/zsh-autocomplete

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="/home/yuchan/.oh-my-zsh"

ENABLE_CORRECTION="true"

plugins=(git fzf zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

zstyle ':autocomplete:tab:*' fzf yes
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:*' add-space \
    executables aliases functions builtins reserved-words commands

bindkey '\e[A' up-line-or-search
bindkey '\eOA' up-line-or-search
bindkey '\e[B' down-line-or-select
bindkey '\eOB' down-line-or-select

zstyle ':autocomplete:*' widget-style menu-select

export interjection="I'd just like to interject for a moment.  What you're referring to as Linux,
is in fact, GNU/Linux, or as I've recently taken to calling it, GNU plus Linux.
Linux is not an operating system unto itself, but rather another free component
of a fully functioning GNU system made useful by the GNU corelibs, shell
utilities and vital system components comprising a full OS as defined by POSIX.

Many computer users run a modified version of the GNU system every day,
without realizing it.  Through a peculiar turn of events, the version of GNU
which is widely used today is often called \"Linux\", and many of its users are
not aware that it is basically the GNU system, developed by the GNU Project.

There really is a Linux, and these people are using it, but it is just a
part of the system they use.  Linux is the kernel: the program in the system
that allocates the machine's resources to the other programs that you run.
The kernel is an essential part of an operating system, but useless by itself;
it can only function in the context of a complete operating system.  Linux is
normally used in combination with the GNU operating system: the whole system
is basically GNU with Linux added, or GNU/Linux.  All the so-called \"Linux\"
distributions are really distributions of GNU/Linux."

export PATH=$PATH:/home/yuchan/.local/bin
alias rm='rm -i'

alias vim='nvim'

[ -f "/home/yuchan/.ghcup/env" ] && source "/home/yuchan/.ghcup/env" # ghcup-env

ZSH_THEME="agnoster"
