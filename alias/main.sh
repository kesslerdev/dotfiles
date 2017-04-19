
#zsh

alias zshreload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias reset-wifi='echo "stop networkmanager..." && sudo service network-manager stop && sleep 3 && echo "clear state..." && sudo rm /var/lib/NetworkManager/NetworkManager.state && sleep 3 && echo "start networkmanager..." && sudo service network-manager start'

pg-client() {
    if [[ $1 == "import" ]]; then
        command psql -h db -U root -W -d $2 -f $3
    elif [[ $1 == "export" ]]; then

    else
        if [[ $1 != "" ]]; then
            command echo "unknown operation" "\"$1\" => defaults to pg-client"
        fi
        command psql -h db -U root ${@:1}
    fi
}