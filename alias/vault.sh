
#vault

vault_set_ghub_token() {
    command echo "export GHUB_VAULT_TOKEN=$1" > $dotfiles_securedir/ghub_vault_token && source $dotfiles_securedir/ghub_vault_token && echo "token: $GHUB_VAULT_TOKEN"
}

alias vault-renew="unset VAULT_TOKEN && vault auth -method=github -path=ied-github token=$GHUB_VAULT_TOKEN"

alias vault-renew-token="vault-renew | grep -Po 'token: (.*)' | cut -d ' ' -f 2"
alias vault-renew-token-save='echo "export VAULT_TOKEN=$(vault-renew-token)" > $dotfiles_securedir/vault_token && source $dotfiles_securedir/vault_token && echo "token: $VAULT_TOKEN"'

