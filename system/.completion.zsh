# server completion
_server() {
    local arguments
    arguments=('start' 'stop' 'restart')
    _alternative "args:action:($arguments)"
}
compdef _server server

# fetch_uploads completion
_fetch_uploads() {
    local arguments
    arguments=('elendil' 'westeros' 'essos' 'amandil')
    _alternative "args:server:($arguments)"
}
compdef _fetch_uploads fetch_uploads

# Gitlab CLI completion
_gitlab-cli() {
	typeset -A opt_args
	_arguments -C \
		'1: :->command'\
		'2: :->subcommand'\
		'*:: :->options'

	case $state in
		command)
			local commands
			commands=(
				'create:create new project'
				'search:search projects with optional query'
				'milestones:list or create project milestones'
				'issues:list or create project issues'
				'help:display help'
			)
			_describe 'command' commands
			;;
		subcommand)
			case $line[1] in
				issues)
					local subcommands
					subcommands=(
						'list:List project issues'
						'create:Create new project issue'
						'close:Close project issue'
					)
					_describe 'subcommand' subcommands
					;;
				milestones)
					local subcommands
					subcommands=(
						'list:List project milestones'
						'create:Create new project milestone'
						'close:Close project milestone'
					)
					_describe 'subcommand' subcommands
					;;
				help)
					local commands
					commands=( 'create' 'search' 'milestones' 'issues' )
					compadd -a commands
					;;
			esac
			;; # End subcommands
		options)
			case $line[2] in
				list)
					case $line[1] in
						issues)
							local subcommands
							subcommands=(
								'--help:output usage information'
								'--all:include closed issues'
								'--closed:list closed issues'
							)
							_describe 'subcommand' subcommands
							;;
						milestones)
							local subcommands
							subcommands=(
								'--help:output usage information'
								'--all:include closed milestones'
								'--closed:list closed milestones'
							)
							_describe 'subcommand' subcommands
							;;
						*)
							local options
							options=(
								'--help:output usage information'
							)
							_describe 'help' options
							;;
					esac
					;; # End list
				*)
					local options
					options=(
						'--help:output usage information'
					)
					_describe 'help' options
					;;
			esac
			;; # End options
	esac

}
compdef _gitlab-cli gitlab-cli
