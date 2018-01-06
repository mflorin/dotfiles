# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# aliases
alias ls='ls -G'
alias mc='mc -b'

# paths
GOPATH=$HOME/work/go
PATH=$PATH:.:/usr/local/go:/usr/local/go/bin:/opt/local/bin:/bin:/opt/local/sbin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/private/bin:/usr/local/bin:$HOME/private/shell:$HOME/private/shell/cdrw:$HOME/private/shell/lan:$HOME/private/shell/logs:$HOME/private/shell/misc:$HOME/private/shell/pwd:$HOME/private/shell/remote:$HOME/private/shell/scanner:$HOME/private/shell/term:$HOME/private/shell/net:$HOME/bin/remotes:/usr/local/share/npm/bin:/Users/${USER}/Library/Android/sdk/platform-tools/:$GOPATH/bin

# setup the prompt
. $HOME/bash_prompts.sh
elite


LSCOLORS="cxfxcxdxbxegedabagacad"

export LSCOLORS PATH PS1 EDITOR GOPATH
unset USERNAME

setterm -blength 0


