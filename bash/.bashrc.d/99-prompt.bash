red="\e[31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
blu="\e[34m"
prp="\e[35m"
bprp="\e[35;1m"
gry="\e[94m"
rst="\e[0m"

git_branch() {
    local git_status="$(git status 2> /dev/null)"
    local on_branch="On branch ([^${IFS}]*)"
    local on_commit="HEAD detached at ([^${IFS}]*)"

    if [[ $git_status =~ $on_branch ]]; then
        local branch=${BASH_REMATCH[1]}
        echo -ne "${ylw} $branch ${rst}"
    elif [[ $git_status =~ $on_commit ]]; then
        local commit=${BASH_REMATCH[1]}
        echo -ne "${cyn} $commit ${rst}"
    fi
}

dirtyorclean() {
    status="$(git status --porcelain 2> /dev/null)"
    local exit="$?"
    if [[ "$exit" -eq 0 ]]; then
        if [[ ${#status} -eq 0 ]]; then
            echo -ne "${grn}•${rst}"
        else
            echo -ne "${red}×${rst}"
        fi
    else
        echo -ne ""
    fi
}

prompt_pwd() {
    echo -ne "\001${cyn}\002$(dirs +0)\001${rst}\002"
}

rootornot() {
    [[ "$(id -u)" -eq 0 ]] &&
        echo -ne "\001${red}\002#\001${rst}\002"
}

PS1='\n$(prompt_pwd)$(git_branch)$(dirtyorclean)\n▲$(rootornot) '
PS2="> "
