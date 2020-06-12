#!/bin/sh
_acs_auto() {
    local CURRENT PREVIOUS OPTION OPTION_1 OPTION_2
    COMPREPLY=()
    CURRENT="${COMP_WORDS[COMP_CWORD]}"
    PREVIOUS="${COMP_WORDS[COMP_CWORD-1]}"
    
    # Change to your options & commands which you want
    OPTION="--option_1 --option_2 --option_3"
    OPTION_1="command_1_1 command_1_2"
    OPTION_2="command_2_1 command_2_2 command_2_3"
 
    if [ ${COMP_CWORD} -eq 1 ]
    then
        COMPREPLY=($(compgen -W "${OPTION}" -- ${CURRENT}))
        return 0
    fi
    case "${PREVIOUS}" in
        --option_1) COMPREPLY=($(compgen -W "${OPTION_1}" -- ${CURRENT})) ;;
        --option_2) COMPREPLY=($(compgen -W "${OPTION_2}" -- ${CURRENT})) ;;
        *)         COMPREPLY=() ;;
    esac
}

# Change your_script.sh to your really script
complete -F _acs_auto your_script.sh
