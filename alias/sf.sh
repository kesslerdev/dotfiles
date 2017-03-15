
#sf

sf() {
    if [[ $1 == "cc" ]]; then
        command bin/console cache:clear --env=test
    elif [[ $1 == "b" ]]; then
	    command bin/behat ${@:2}
    elif [[ $1 == "mock" ]]; then
	    command bin/sf3_restart_mock_servers
    elif [[ $1 == "mockb" ]]; then
	    sf mock && sf b
    elif [[ $1 == "br" ]]; then
	    command bin/behat --rerun ${@:2}
    elif [[ $1 == "ccb" ]]; then
	    sf cc && sf b ${@:2}
    elif [[ $1 == "ccbr" ]]; then
	    sf cc && sf br ${@:2}
    elif [[ $1 == "codecov" ]]; then
        begin=$(date +"%s")
	    ssdv xdebug cli on && sf b --profile coverage ${@:2} && ssdv xdebug cli off
        termin=$(date +"%s")
        difftimelps=$(($termin-$begin))
        echo "$(($difftimelps / 60))m$(($difftimelps % 60))s elapsed for coverage generation."
    else
        command echo "unknown operation" "\"$1\""
    fi
}