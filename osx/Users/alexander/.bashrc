# System-wide .bashrc file for interactive bash(1) shells.
# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

alias ls='ls -G'

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
#export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

export HISTSIZE=5000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
alias ls='ls -G'
#alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
      
if [ -f /Users/alexander/.opam/opam-init/init.sh ]; then
	. /Users/alexander/.opam/opam-init/init.sh > /dev/null 2> /dev/null
fi

PS1='\[\e[1;33m\][\A]\[\e[0m\] \[\e[1;31m\]\u\[\e[0m\]\[\e[1;34m\]@\h\[\e[0m\]:\w\$ '

alias getall="wget -nc -r -l 1 $1"
alias minicom="minicom -c on"
alias chroot="/usr/sbin/chroot"
alias mplf='mplayer -forceidx'

export EDITOR=vim
export TERM=xterm
export MINICOM="-c on"

export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.0/lib:$DYLD_LIBRARY_PATH
export GEM_HOME=$HOME/.gems
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/Users/alexander/Documents/workspace/bin:$PATH
export PATH=/Users/alexander/Documents/workspace/bin/toolchains/gcc-arm-none-eabi-4_8-2014q1/bin/:$PATH
export PATH=$GEM_HOME/bin:$PATH
export PATH=/Developer/NVIDIA/CUDA-6.0/bin:$PATH
export PATH=/Users/alexander/Documents/workspace/bin/android/android-sdk-macosx/tools:$PATH
export PATH=/Users/alexander/Documents/workspace/bin/android/android-sdk-macosx/platform-tools:$PATH

alias mvim="/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim"
alias vim="/usr/local/Cellar/macvim/*/MacVim.app/Contents/MacOS/Vim"
alias clang_format="/Users/alexander/Documents/workspace/builds/llvm/build/bin/clang-format"
export GOPATH=/Users/alexander/.go
