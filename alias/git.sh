
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
    else
        command git "$@"
    fi
}