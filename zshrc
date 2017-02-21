#used to run dotfiles files with keeping system default .zshrc

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

if [ -f $olddir/.zshrc ]; then
    echo "[DotFiles] Using old dotfile $olddir/.zshrc"
    . $olddir/.zshrc
fi