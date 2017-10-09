
#git

alias "g=git"
alias "gti=git"

alias gitcom='git add . && git commit --amend'
alias gitco='git add . && git commit'

gitsync () {
	git checkout "$@";
	git fetch upstream;
	git merge upstream/"$@";
	git push origin "$@";
}

git() {
    if [[ $@ == "branch" ]]; then
        command git branch -a
    elif [[ $@ == "remote-prune" ]]; then
	    command git remote | xargs -t -L1 git remote prune
    elif [[ $@ == "com" ]]; then
	    gitcom
    elif [[ $@ == "comp" ]]; then
	    gitcom && git push -u origin $(git branch-name) -f
    elif [[ $1 == "patch" ]]; then

	    if [[ $2 == "create" ]]; then
            command git format-patch -n HEAD^
        elif [[ $2 == "apply" ]]; then

            if [[ $3 == "check" ]]; then
                command git apply --check ${@:4}
            elif [[ $3 == "stat" ]]; then
                command git apply --stat ${@:4}
            else
                command git am --signoff < ${@:3}
            fi

        else
            echo "uknown patch command \"$2\""
        fi

    else
        command git "$@"
    fi
}
