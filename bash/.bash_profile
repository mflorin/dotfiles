# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# aliases
alias ls='ls --color'
alias mc='mc -b'

# path
old_path=$PATH
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/private/bin:/usr/local/bin:$HOME/private/shell:$HOME/private/shell/cdrw:$HOME/private/shell/lan:$HOME/private/shell/logs:$HOME/private/shell/misc:$HOME/private/shell/pwd:$HOME/private/shell/remote:$HOME/private/shell/scanner:$HOME/private/shell/term:$HOME/private/shell/net:$old_path

# setup the prompt
. /home/mflorin/private/shell/misc/bash_prompts.sh
elite


export PATH PS1 EDITOR
unset USERNAME
