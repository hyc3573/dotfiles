[ -z "$TMUX"  ] && { exec tmux new-session;}

pfetch

alias ls='ls --color=tty'

source ~/Git/znap/zsh-snap/znap.zsh

#znap source marlonrichert/zsh-autocomplete
source ~/Git/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# ENABLE_CORRECTION="true"

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

alias rm='rm -i'
alias usrctl='systemctl --user'
alias cht='cht.sh'
alias :e='enw'
alias lf='lfrun'
alias mpvs='mpv --vo=sixel --really-quiet'
alias vim='nvim'
alias enw='emacsclient -nw -c'
alias emacs='emacsclient -c'
alias ere='systemctl --user restart emacs'
alias addm='yt-dlp --extract-audio -o "~/Musics/%(title)s.%(ext)s"'
alias fuck='setxkbmap -option caps:escape'

[ -f "/home/yuchan/.ghcup/env" ] && source "/home/yuchan/.ghcup/env" # ghcup-env

# ZSH_THEME="typewritten" # set by `omz`


export EDITOR='editor'
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

setopt auto_pushd
setopt PUSHDSILENT

fpath=($fpath "/home/yuchan/.zfunctions")

eval "$(starship init zsh)"

SAVEHIST=10000
HISTFILE=~/.zsh_history

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
