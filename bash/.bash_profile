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
GOPATH=$HOME/work/code/go
PATH=$PATH:.:/usr/local/go:/usr/local/go/bin:/opt/local/bin:/bin:/opt/local/sbin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$HOME/private/bin:/usr/local/bin:$HOME/private/shell:$HOME/private/shell/cdrw:$HOME/private/shell/lan:$HOME/private/shell/logs:$HOME/private/shell/misc:$HOME/private/shell/pwd:$HOME/private/shell/remote:$HOME/private/shell/scanner:$HOME/private/shell/term:$HOME/private/shell/net:$HOME/bin/remotes:/usr/local/share/npm/bin:/Users/${USER}/Library/Android/sdk/platform-tools/:$GOPATH/bin:$HOME/work/bin

# setup the prompt
. $HOME/bash_prompts.sh
elite


LSCOLORS="cxfxcxdxbxegedabagacad"

export LSCOLORS PATH PS1 EDITOR GOPATH
unset USERNAME

# setterm -blength 0

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/florin/.sdkman"
[[ -s "/Users/florin/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/florin/.sdkman/bin/sdkman-init.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

export DASHBOARD_CLIENT_CERT_PASS=$(cat ~/work/etc/dashboard_client_cert_pass)
export DASHBOARD_CLIENT_CERT_FILE=~/work/etc/dashboard_client_cert.p12
export WORK_D=$HOME/work
export PROJECTS_D=$WORK_D/projects
export FUNCTIONS_D=$WORK_D/functions

for f in $(ls ${PROJECTS_D}/*/env/default.env 2>/dev/null); do
	source ${f}
done

for f in $(ls ${FUNCTIONS_D}/*.sh); do
	source ${f}
done

