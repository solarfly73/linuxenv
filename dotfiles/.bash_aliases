if [ -f ~/.dircolors ];then
    eval $(dircolors -b ~/.dircolors)
    alias ls='ls -F --color=auto'
else
    alias ls='ls -F'
fi
alias nve=". $HOME/np_env/bin/activate"
alias nve3=". $HOME/np_env3/bin/activate"
alias ssh="ssh -A"

function npclone() { git clone git@github.com:NodePrime/$@ ;}
function clone() { git clone git@github.com:$@ ;}
