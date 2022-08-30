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
  PS1='${debian_chroot:+($debian_chroot)}\[\e[1;34m\]\u[\w]\\$\[\e[m\] '
fi

alias vi='vim'
alias e='vim'
alias v='vim'
alias scadopen='scadopen.sh'
alias oct='octave --no-gui'
alias f="find . -name"
#alias lisp='emacs -nw --eval "(slime)"'
#alias slut='sudo shutdown -h now'

# Check which folders take up the most space here
alias dirsizes='du -sh ./* | sort -h'
#alias spacemacs='emacsclient -n -c'

# Locally built stuff
PATH=$PATH:/home/torbjorn/.local/bin

# These should go in .bash_profile, but that file is so hard to reload!
PATH=$PATH:/home/torbjorn/scripts

# Needed to run Emacs as daemon, see
# https://www.emacswiki.org/emacs/EmacsAsDaemon
export ALTERNATE_EDITOR=""
export EDITOR="vim"          # $EDITOR should open in terminal
#export VISUAL="emacsclient -c -a emacs" # $VISUAL opens in GUI with non-daemon as alternate

# Visualize git trees with git graphviz | dotty /dev/stdin
alias gitgraph="git log --graph --oneline --decorate --date=relative --all"
alias gl="git branch; git log --oneline -n 10"

# For rdm and rc that is home-compiled
PATH=$PATH:/home/torbjorn/Downloads/rtags/bin

PATH=$PATH:.luarocks/bin/

# For xtensa architecture toolchain. I'm not at all sure that I need it...
PATH=$PATH:/home/torbjorn/repos/esp-open-sdk/xtensa-lx106-elf/bin

# Required for building RRF
#PATH=$PATH:/home/torbjorn/eclipse-workspace/RepRapFirmware/Tools/crc32appender/linux-x86_64
#PATH=$PATH:/home/torbjorn/Downloads/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux/gcc-arm-none-eabi-10-2020-q4-major

PATH=$PATH:~/.roswell/bin


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# cd to previous directory in bash is `cd -`. Avoid the need for space.
alias cd-="cd -"
alias cdlinc="cd ~/repos/line-collision-detector/linc/linc"
alias cdl="cd ~/repos/line-collision-detector/"
alias cdll="cd ~/repos/line-collision-detector/linc/"
alias cdlll="cd ~/repos/line-collision-detector/linc/linc/"
alias cdhpm="cd ~/repos/hp-mark/hpm/hpm"
alias cdh="cd ~/repos/hp-mark/"
alias cdhu="cd ~/repos/hp-mark/use/"
alias cdhh="cd ~/repos/hp-mark/hpm/"
alias cdhhh="cd ~/repos/hp-mark/hpm/hpm/"
alias cdhhhe="cd ~/repos/hp-mark/hpm/hpm/ed/"
alias cdr="cd ~/eclipse-workspace/RepRapFirmware/"
alias cdrs="cd ~/eclipse-workspace/RepRapFirmware/src/"
alias cdrsm="cd ~/eclipse-workspace/RepRapFirmware/src/Movement/"
alias cdrsmk="cd ~/eclipse-workspace/RepRapFirmware/src/Movement/Kinematics/"
alias up="cd .."
alias u="cd .."
alias down="cd hpm"
alias d="cd hpm"
alias arve="ssh -p 56874 torbjorn@deltmot.asuscomm.com"
alias cdblog="cd /home/torbjorn/repos/torbjornludvigsen-com/blog"
alias ok_sound="paplay /usr/share/sounds/freedesktop/stereo/complete.oga"
alias cdhp="cd ~/repos/hangprinter/src"
alias cdhpf="cd ~/repos/hangprinter/firmware/RepRapFirmware/Duet3"
. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CHALK_SOLVER_MAX_SIZE=20
export CHALK_OVERFLOW_DEPTH=30000
