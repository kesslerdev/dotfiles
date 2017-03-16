#docker image skimia/secure-dev-platform

ssdv() {
    if [[ $1 == "xdebug" ]]; then
        if [[ $2 == "cli" ]]; then
            if [[ $3 == "off" ]]; then
                echo "[DotFiles] disable xdebug for cli"
                if [ -f /etc/php5/cli/conf.d/25-xdebug.ini ]; then
                    command sudo rm /etc/php5/cli/conf.d/25-xdebug.ini
                else
                    echo "Already disabled"
                fi
            else
                echo "[DotFiles] enable xdebug for cli"
                if [ ! -f /etc/php5/cli/conf.d/25-xdebug.ini ]; then
                    command sudo ln -s /etc/php5/cli/25-xdebug.ini /etc/php5/cli/conf.d/25-xdebug.ini
                else
                    echo "Already enabled"
                fi
                
            fi
        elif [[ $2 == "apache" ]]; then
	        if [[ $3 == "off" ]]; then
                echo "[DotFiles] disable xdebug for apache"
                if [ -f /etc/php5/apache2/conf.d/25-xdebug.ini ]; then
                    command sudo rm /etc/php5/apache2/conf.d/25-xdebug.ini
                    command sudo service apache2 reload
                else
                    echo "Already disabled"
                fi
            else
                echo "[DotFiles] enable xdebug for apache"
                if [ ! -f /etc/php5/apache2/conf.d/25-xdebug.ini ]; then
                    command sudo ln -s /etc/php5/cli/25-xdebug.ini /etc/php5/apache2/conf.d/25-xdebug.ini
                    command sudo service apache2 reload
                else
                    echo "Already enabled"
                fi
                
            fi 
        else
            command echo "unknown operation" "\"$1:$2\""
        fi
    else
        command echo "unknown operation" "\"$1\""
    fi
}