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

# path
old_path=$PATH
PATH=.:/opt/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/private/bin:/usr/local/bin:$HOME/private/shell:$HOME/private/shell/cdrw:$HOME/private/shell/lan:$HOME/private/shell/logs:$HOME/private/shell/misc:$HOME/private/shell/pwd:$HOME/private/shell/remote:$HOME/private/shell/scanner:$HOME/private/shell/term:$HOME/private/shell/net:$old_path:$HOME/bin/remotes:/usr/local/share/npm/bin

# setup the prompt
. $HOME/bash_prompts.sh
elite


# OptAF configuration
LSCOLORS="cxfxcxdxbxegedabagacad"

export LSCOLORS PATH PS1 EDITOR
unset USERNAME

setterm -blength 0

##
# Your previous /Users/mflorin/.bash_profile file was backed up as /Users/mflorin/.bash_profile.macports-saved_2012-08-13_at_18:04:14
##

# MacPorts Installer addition on 2012-08-13_at_18:04:14: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# MacPorts Installer addition on 2014-09-25_at_23:13:27: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

