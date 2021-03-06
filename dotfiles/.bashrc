# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# Derek's awesome colored prompt
. ~/.colors
. ~/.git_prompt  # Sets PROMPT_COMMAND

prompt_root_user="\[$bldred\]"'\u'"\[$txtrst\]"
prompt_normal_user="\[$txtwht\]"'\u'"\[$txtrst\]"

PS1='$(if [ $prompt_user -eq 0 ];then echo "'$prompt_root_user'"; else echo "'$prompt_normal_user'"; fi)'"@\h:\$curpwd\[$txtgrn\]\$git_branch\[$txtrst\]\[$txtred\]\$git_dirty\[$txtrst\]\$prompt_sign "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

unset command_not_found_handle

# Make EDITOR sensible
if [ -x /etc/alternatives/vim ]; then
    export EDITOR=/etc/alternatives/vim
elif [ -x /etc/alternatives/vi ]; then
    export EDITOR=/etc/alternatives/vi
elif [ -x /usr/bin/vim ]; then
    export EDITOR=/usr/bin/vim
else
    export EDITOR=/usr/bin/vi
fi

# enable some variables for i3wm
export TERMINAL=`which terminology`   # if this fails, TERMINAL will be empty

[ -s "$HOME/.gvm/scripts/gvm" ] && . "$HOME/.gvm/scripts/gvm"
gvm use go1.8.3
export GOPATH=/home/derek/go
echo "Activating Logitech GOPATH in krypto-api/go"
kactivate # see .bash_aliases
if [ -e ~/.krypto_testenv ]; then
    . ~/.krypto_testenv
fi

# nvm environment setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH=$GOPATH/bin:$PATH
