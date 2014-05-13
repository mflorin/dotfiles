#!/bin/sh


function prompt_command_elite {

	TERMWIDTH=${COLUMNS}
	PWDWIDTH=30
	if [ "${PWDWIDTH}" -gt "${TERMWIDTH}" ];
	then
		PWDWIDTH=$TERMWIDTH
	fi

	# Calculate the width of the prompt:

	newPWD="${PWD}"
	# Add all the accessories below ...
	let promptsize=$(echo -n "--(\$${newPWD})--" | wc -c | tr -d " ")
	let fillsize=${PWDWIDTH}-${promptsize}
	fill=""
	while [ "$fillsize" -gt "0" ] 
	do 
		fill="${fill}-"
		let fillsize=${fillsize}-1
	done
	if [ "$fillsize" -lt "0" ]
	then
		let cut=3-${fillsize}
		newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cut\}\)\(.*\)/\2/")"
	fi
	echo
	elite
}

function elite {
    local GRAD1=`tty|cut -d/ -f3`
    local COLOR1="\[\033[0;36m\]"
    local COLOR2="\[\033[1;36m\]"
    local COLOR3="\[\033[1;30m\]"
    local COLOR4="\[\033[0m\]"
	local BRIGHT_YELLOW="\[\033[1;33m\]"
	local BRIGHT_GREEN="\[\033[01;32m\]"
	local DARK_GRAY="\[\033[01;30m\]"

	local branch=$(git branch 2>/dev/null | grep "*" | cut -d " " -f 2)
	if [ ! -z "${branch}" ]; then
		branch="[ ${branch} ]"
	fi
    PS1="$COLOR3-$COLOR1-$COLOR2($BRIGHT_YELLOW\u$COLOR3@$BRIGHT_GREEN\h$COLOR2)$COLOR1-$COLOR2($DARK_GRAY\$(date +%I:%M%P)$COLOR3 $DARK_GRAY\$(date +%m/%d/%y)$COLOR2)$COLOR1-$COLOR3-$COLOR4\n$COLOR3-$COLOR1-$COLOR2($DARK_GRAY${newPWD}$COLOR2)$COLOR1-$COLOR3${branch}-$COLOR4 "
PS2="$COLOR2-$COLOR1-$COLOR3-$COLOR4 "
}

PROMPT_COMMAND=prompt_command_elite

