# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if [ "$color_prompt" = yes ]; then
PS1="${debian_chroot:+($debian_chroot)}\e[1;31m\u[\w]\\$\e[m "
else
  #changed the PS1 below on 6/14/08 for a color prompt
  PS1='${debian_chroot:+($debian_chroot)}\[\e[1;32m\]\u[\w]\\$\[\e[m\] '
fi

export OPENSCADPATH="/home/torbjorn/Desktop/VanityRepRap/Hangprinter/Thingiverse-Projects/ThreadedLibrary/"


alias show='mupdf rap.pdf &'
alias raptabs='gnome-terminal --tab --title "1 Vim Source" --tab --title "2 Generate/Collect data" --tab --title "3 Vim Gnuplot" --tab --title "4 Gnuplot" --tab --title "5 Vim rap.tex" --tab --title "6 make, git, mupdf"; exit'
alias reptabs='raptabs'

#alias firefox='start-tor-browser'
alias vi='vim'
alias e='vim'
alias scadopen='scadopen.sh'
alias cc='/usr/lib/gcc-snapshot/bin/gcc -fdiagnostics-color'
alias oct='octave --no-gui'
alias lisp='emacs -nw --eval "(slime)"'
alias slut='sudo shutdown -h now'

# GTD related help scripts
# Needed because of Norwegian names in GTD tickle directories
export LC_TIME=nb_NO.utf8
# Mails sent to future self through tickle system and calendar
alias idag='cal; calendar -f ~/GTD/calendar.personal; echo; echo "Filer:"; l ~/GTD/tickle/`date +%d` ~/GTD/tickle/`date +%B`;'
# Remind me about my calendar
idag



# Check which folders take up the most space here
alias dirsizes='du -sh ./* | sort -h'
alias spacemacs='emacsclient -n -c'
alias em='emacs'

# Get quicker access to GTD
alias In='spacemacs /home/torbjorn/GTD/In'
alias Göra='spacemacs /home/torbjorn/GTD/Göra'
alias Gøra='spacemacs /home/torbjorn/GTD/Göra'

# These should go in .bash_profile, but that file is so hard to reload!
PATH=$PATH:/home/torbjorn/scripts
PATH=$PATH:/home/torbjorn/scripts/init-rapport:/home/torbjorn/scripts/init-physrap
PATH=$PATH:/home/torbjorn/scripts/tor-browser_en-US
# Roswell lisp organizer saves scripts here:
export PATH=$PATH:$HOME/.roswell/bin

# Needed to run Emacs as daemon, see
# https://www.emacswiki.org/emacs/EmacsAsDaemon
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"          # $EDITOR should open in terminal
export VISUAL="emacsclient -c -a emacs" # $VISUAL opens in GUI with non-daemon as alternate

# Visualize git trees with git graphviz | dotty /dev/stdin
alias gitgraph="git log --graph --oneline --decorate --date=relative --all"
alias gl="git branch; git log --oneline | head"
