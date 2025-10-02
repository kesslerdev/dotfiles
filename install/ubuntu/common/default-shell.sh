#!/usr/bin/env bash

set -Eeuo pipefail

if [ "${DOTFILES_DEBUG:-}" ]; then
    set -x
fi

function set_default_shell_zsh() {
    if [ "$(basename "$SHELL")" = "zsh" ]; then
        echo "default shell is already zsh"
        echo "no changes were performed"
    else
        chsh -s /bin/zsh
    fi
}

function main() {
    set_default_shell_zsh
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main
fi