if [ -f ~/.dircolors ];then
    eval $(dircolors -b ~/.dircolors)
    alias ls='ls -F --color=auto'
else
    alias ls='ls -F'
fi
alias nve=". $HOME/np_env/bin/activate"
