# Server completion
_server() {
	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -W "start stop restart" -- $cur) )
}

complete -F _server server

# Vhost completion
_vhost_autocomplete() {
	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -W "$(ls ~/Development/vhost/ )" -- $cur) )
}

complete -F _vhost_autocomplete vhost

# Project completion
_project_autocomplete() {
	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -W "$(ls ~/Development/projects/ )" -- $cur) )
}

complete -F _project_autocomplete project

# Kunder completion
_kunder_autocomplete() {

	saveIFS=$IFS
	IFS=$'\n'

	COMPREPLY=()

	local cur=${COMP_WORDS[COMP_CWORD]}

	COMPREPLY=( $(compgen -d -W '$( find ~/Documents/Kunder -type d -depth 2 -exec basename {} \; )' -- $cur) )

	local escaped_single_qoute="'\''"
	local i=0
	for entry in ${COMPREPLY[*]}
	do
		if [[ "${cur:0:1}" == "'" ]]
		then
			# started with single quote, escaping only other single quotes
			# [']bla'bla"bla\bla bla --> [']bla'\''bla"bla\bla bla
			COMPREPLY[$i]="${entry//\'/${escaped_single_qoute}}"
		elif [[ "${cur:0:1}" == "\"" ]]
		then
			# started with double quote, escaping all double quotes and all backslashes
			# ["]bla'bla"bla\bla bla --> ["]bla'bla\"bla\\bla bla
			entry="${entry//\\/\\\\}"
			COMPREPLY[$i]="${entry//\"/\\\"}"
		else
			# no quotes in front, escaping _everything_
			# [ ]bla'bla"bla\bla bla --> [ ]bla\'bla\"bla\\bla\ bla
			entry="${entry//\\/\\\\}"
			entry="${entry//\'/\'}"
			entry="${entry//\"/\\\"}"
			COMPREPLY[$i]="${entry// /\\ }"
		fi
		(( i++ ))
	done

	IFS=$saveIFS

}

complete -o dirnames -F _kunder_autocomplete kunder

# Gitlab CLI completion
_gitlab-cli() {

	local cur prev

	cur=${COMP_WORDS[COMP_CWORD]}
	prev=${COMP_WORDS[COMP_CWORD-1]}

	case ${COMP_CWORD} in
		1)
			COMPREPLY=( $(compgen -W "create search milestones issues help" -- $cur) )
			;;
		2)
			case ${prev} in
				milestones)
					COMPREPLY=($(compgen -W "list create close" ${cur}))
					;;
				issues)
					COMPREPLY=($(compgen -W "list create close" ${cur}))
					;;
			esac
			;;
		*)
			COMPREPLY=()
			;;
	esac

}

complete -F _gitlab-cli gitlab-cli

_composer()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	local cmd=${COMP_WORDS[0]}
	if ($cmd > /dev/null 2>&1)
	then
		COMPREPLY=( $(compgen -W "$($cmd list --raw | cut -f 1 -d " " | tr "\n" " ")" -- $cur) )
	fi
}
complete -F _composer composer
complete -F _composer composer.phar

_fetch_uploads()
{
	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -W "elendil westeros essos amandil" -- $cur) )
}
complete -F _fetch_uploads fetch_uploads
