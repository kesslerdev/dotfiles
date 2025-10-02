#!/usr/bin/env bash

set -Eeuo pipefail

if [ "${DOTFILES_DEBUG:-}" ]; then
    set -x
fi

# https://code.visualstudio.com/docs/setup/linux
function apt_install_code() {
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
    echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |
        sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
    rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https
    sudo apt-get update -y
    sudo apt-get install -y code
}

function main() {
    if ! type code >/dev/null 2>&1; then
        apt_install_code
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi

