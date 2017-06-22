# Kessler's DotFiles

## auto installation

One line install

`git clone https://github.com/kesslerdev/dotfiles.git ~/dotfiles && cd ~/dotfiles && chmod +x makesymlinks.sh && ./makesymlinks.sh`


### Configuring vault

`vault_set_ghub_token {GITHUB_TOKEN}`

then

`vault-renew-token-save`

## TODO

- [ ] at install on copy old dotfiles check if file exist to avoid "mv: cannot stat ‘/home/skimia/.bashrc’: No such file or directory"