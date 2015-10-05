#!/usr/bin/env bash

# Get script dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Load environment variables
source "$DIR/../system/.env"

# Load Bash It
source $BASH_IT/bash_it.sh

# Load aliases
source "$DIR/../system/.alias"

# Load functions
source "$DIR/../system/.function"

# Load bash completions
source "$DIR/../system/.completion.bash"

# Load ncreate config
source ~/.bash_ncreate_config
