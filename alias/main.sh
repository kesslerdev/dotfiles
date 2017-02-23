
#zsh

alias aliasrc='gedit ~/.aliasrc && zshreload'
alias zshreload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias reset-wifi='echo "stop networkmanager..." && sudo service network-manager stop && sleep 3 && echo "clear state..." && sudo rm /var/lib/NetworkManager/NetworkManager.state && sleep 3 && echo "start networkmanager..." && sudo service network-manager start'

alias crlftolf_recur="find . -type f -exec grep -qIP '\r\n' {} ';' -exec perl -pi -e 's/\r\n/\n/g' {} '+'"