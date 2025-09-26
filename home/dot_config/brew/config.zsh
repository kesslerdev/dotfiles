#!/usr/bin/env zsh

# Load Homebrew shellenv if installed
function _setup_homebrew() {
    local brew_executable
    [[ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]] && brew_executable="/home/linuxbrew/.linuxbrew/bin/brew"
    [[ -z "$brew_executable" && -x "/usr/local/bin/brew" ]] && brew_executable="/usr/local/bin/brew"
    if [[ -n "$brew_executable" ]]; then
        eval "$("$brew_executable" shellenv)"
        return 0
    fi
    return 1
}

_setup_homebrew
unfunction _setup_homebrew

local brew_prefix

if (( $+commands[brew] )) && brew_prefix=$(brew --prefix go 2>/dev/null); then
    export GOPATH="${GOPATH:-${HOME}/.go}"
    path+=("${GOPATH}/bin")
fi

if (( $+commands[brew] )) && brew_prefix=$(brew --prefix node 2>/dev/null); then
    export NPM_CONFIG_PREFIX="${NPM_CONFIG_PREFIX:-${HOME}/.npm-global}"
    path+=("${NPM_CONFIG_PREFIX}/bin")
fi

fpath+=("/home/linuxbrew/.linuxbrew/share/zsh/site-functions")
unset brew_prefix