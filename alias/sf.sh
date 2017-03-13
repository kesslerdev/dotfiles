
#sf

sf() {
    if [[ $@ == "cc" ]]; then
        command bin/console cache:clear --env=test
    elif [[ $@ == "b" ]]; then
	    command bin/behat
    elif [[ $@ == "mock" ]]; then
	    command bin/sf3_restart_mock_servers
    elif [[ $@ == "mockb" ]]; then
	    sf mock && sf b
    elif [[ $@ == "br" ]]; then
	    command bin/behat --rerun
    elif [[ $@ == "ccb" ]]; then
	    sf cc && sf b
    elif [[ $@ == "ccbr" ]]; then
	    sf cc && sf br
    else
        command echo "unknown operation" "\"$@\""
    fi
}