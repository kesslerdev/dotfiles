
#sf

sf() {
    if [ -f bin/console ]; then
        console=bin/console
    elif [ -f app/console ]; then
        console=app/console
    else
        echo "console not found!"
        return;
    fi

    if [[ $1 == "cc" ]]; then
        command $console cache:clear --no-warmup --env=test && $console cache:warmup --env=test && php ~/dotfiles/alias/php/clear_apc.php
    elif [[ $1 == "dbd" ]]; then
	    command $console doctrine:migrations:diff --env=test
    elif [[ $1 == "resetdb" ]]; then
            echo "resetting DB ..."
            command $console doctrine:query:sql --env=test -q "DROP SCHEMA public CASCADE" && $console doctrine:query:sql --env=test -q "CREATE SCHEMA public" && $console doctrine:schema:create -q --env=test && $console doctrine:schema:create -q --env=test --em=event_sourcing
            echo "OK!"
    elif [[ $1 == "dbm" ]]; then
	    command $console doctrine:migrations:migrate  --env=test
    elif [[ $1 == "dbr" ]]; then
	    command $console doctrine:migrations:migrate prev  --env=test
    elif [[ $1 == "b" ]]; then
	    command bin/behat ${@:2}
    elif [[ $1 == "gb" ]]; then
	    command git list-modified | grep -E "tests.*\.feature$" > /tmp/behat.temp.scenarios && sf b /tmp/behat.temp.scenarios && rm /tmp/behat.temp.scenarios
    elif [[ $1 == "mock" ]]; then
        if [ -f bin/sf3_restart_mock_servers ]; then
            command bin/sf3_restart_mock_servers
        elif [ -f bin/restart_mock_servers ]; then
            command bin/restart_mock_servers
        elif [ -f bin/mock_servers ]; then
            command bin/mock_servers restart
        else
            echo "mocks not found !"
            return;
        fi
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
        command $console ${@:1}
    fi
}
