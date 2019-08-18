PATH=$PATH:~/go/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

#BGPPREFIX=$(brew --prefix bash-git-prompt)
BGPREFIX=/usr/local/opt/bash-git-prompt


PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

if [ -f "$BGPREFIX/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$BGPREFIX/share/gitprompt.sh"
fi
    

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias ls='ls -G'
alias ll='ls -lG'

GOPATH=~/go

PATH=$PATH:/Users/jlebrun/Library/Android/sdk/platform-tools/




