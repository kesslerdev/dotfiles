
#sf

sf() {
    if [[ $@ == "cc" ]]; then
        command bin/console cache:clear --env=test
    elif [[ $@ == "b" ]]; then
	    command bin/behat
    elif [[ $@ == "br" ]]; then
	    command bin/behat --rerun
    elif [[ $@ == "ccb" ]]; then
	    command bin/console cache:clear --env=test && bin/behat
    elif [[ $@ == "ccbr" ]]; then
	    command bin/console cache:clear --env=test && bin/behat --rerun
    else
        command echo "unknown operation" "\"$@\""
    fi
}