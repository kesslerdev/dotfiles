#used to run dotfiles files with keeping system default .zshrc

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

if [ -f $olddir/.zshrc ]; then
    . $olddir/.zshrc
fi