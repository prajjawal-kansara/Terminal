#!/bin/bash

HISTFILE=~/.custom_shell_history
HISTFILESIZE=1000
HISTSIZE=1000

# Function to display the prompt
prompt() {
    local EXIT_CODE=$?
    local GREEN='\[\033[0;32m\]'
    local BLUE='\[\033[0;34m\]'
    local RESET='\[\033[0m\]'
    PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${RESET}\$ "
    history -a  # Append current session history to $HISTFILE
}

# Function for command completion
command_complete() {
    local cmd="${COMP_WORDS[0]}"
    local word="${COMP_WORDS[COMP_CWORD]}"
    COMPREPLY=($(compgen -c "$word"))
}

# Custom built-in command: 'hello'
hello() {
    echo "Hello from custom shell!"
}

# Custom built-in command: 'calc'
calc() {
    if [ $# -eq 0 ]; then
        echo "Usage: calc <expression>"
        return 1
    fi
    echo "$@" | bc -l
}

# Set up command completion
complete -F command_complete -o default -o bashdefault

# Set up aliases
alias ll='ls -la'
alias h='history'

# Main shell loop
while true; do
    prompt
    read -e -p "$PS1" cmd
    history -s "$cmd"

    # Handle built-in commands
    case "$cmd" in
        exit)
            break
            ;;
        hello)
            hello
            continue
            ;;
        calc*)
            calc ${cmd#calc }
            continue
            ;;
        cd*)
            cd ${cmd#cd }
            continue
            ;;
    esac

    # Execute the command
    eval "$cmd"
done

echo "Exiting custom shell. Goodbye!"
