
#sf

sf() {
    if [[ $1 == "cc" ]]; then
        command bin/console cache:clear --no-warmup --env=test && bin/console cache:warmup --env=test
    elif [[ $1 == "dbd" ]]; then
	    command bin/console doctrine:migrations:diff --env=test
    elif [[ $1 == "dbm" ]]; then
	    command bin/console doctrine:migrations:migrate  --env=test
    elif [[ $1 == "dbr" ]]; then
	    command bin/console doctrine:migrations:migrate prev  --env=test
    elif [[ $1 == "b" ]]; then
	    command bin/behat ${@:2}
    elif [[ $1 == "gb" ]]; then
	    command git list-modified | grep -E "tests.*\.feature$" > /tmp/behat.temp.scenarios && sf b /tmp/behat.temp.scenarios && rm /tmp/behat.temp.scenarios
    elif [[ $1 == "mock" ]]; then
	    command bin/sf3_restart_mock_servers
    elif [[ $1 == "mockb" ]]; then
	    sf mock && sf b
    elif [[ $1 == "br" ]]; then
	    command bin/behat --rerun ${@:2}
    elif [[ $1 == "gbr" ]]; then
	    command git list-modified | grep -E "tests.*\.feature$" > /tmp/behat.temp.scenarios && sf br /tmp/behat.temp.scenarios && rm /tmp/behat.temp.scenarios
    elif [[ $1 == "bs" ]]; then
	    command bin/behat --stop-on-failure ${@:2}
    elif [[ $1 == "brs" ]]; then
	    command bin/behat --rerun --stop-on-failure ${@:2}
    elif [[ $1 == "ccb" ]]; then
	    sf cc && sf b ${@:2}
    elif [[ $1 == "ccgb" ]]; then
	    command git list-modified | grep -E "tests.*\.feature$" > /tmp/behat.temp.scenarios && sf ccb /tmp/behat.temp.scenarios && rm /tmp/behat.temp.scenarios
    elif [[ $1 == "ccgbr" ]]; then
	    command git list-modified | grep -E "tests.*\.feature$" > /tmp/behat.temp.scenarios && sf ccbr /tmp/behat.temp.scenarios && rm /tmp/behat.temp.scenarios
    elif [[ $1 == "ccbr" ]]; then
	    sf cc && sf br ${@:2}
    elif [[ $1 == "ccbs" ]]; then
	    sf cc && sf bs ${@:2}
    elif [[ $1 == "ccbrs" ]]; then
	    sf cc && sf brs ${@:2}
    elif [[ $1 == "codecov" ]]; then
        begin=$(date +"%s")
	    ssdv xdebug apache on && ssdv xdebug cli on && sf b --tags '~@no-cov' --profile coverage ${@:2} && ssdv xdebug apache off && ssdv xdebug cli off
        termin=$(date +"%s")
        difftimelps=$(($termin-$begin))
        echo "$(($difftimelps / 60))m$(($difftimelps % 60))s elapsed for coverage generation."
    else
        if [[ $1 != "" ]]; then
            command echo "unknown operation" "\"$1\" => defaults to symfony console"
        fi
        command bin/console ${@:1}
    fi
}