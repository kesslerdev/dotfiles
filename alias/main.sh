
#zsh

alias zshreload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias reset-wifi='echo "stop networkmanager..." && sudo service network-manager stop && sleep 3 && echo "clear state..." && sudo rm /var/lib/NetworkManager/NetworkManager.state && sleep 3 && echo "start networkmanager..." && sudo service network-manager start'
