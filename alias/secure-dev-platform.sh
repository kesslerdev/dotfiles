#docker image skimia/secure-dev-platform

ssdv() {
    if [[ $1 == "xdebug" ]]; then
        if [[ $2 == "cli" ]]; then
            if [[ $3 == "off" ]]; then
                command sudo rm /etc/php5/cli/conf.d/25-xdebug.ini
            else
                command sudo ln -s /etc/php5/cli/25-xdebug.ini /etc/php5/cli/conf.d/25-xdebug.ini
            fi
        elif [[ $2 == "apache" ]]; then
	        command echo "uimplemented operation" "\"$1:$2\""  
        else
            command echo "unknown operation" "\"$1:$2\""
        fi
    else
        command echo "unknown operation" "\"$1\""
    fi
}