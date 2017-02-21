#used to run dotfiles files with keeping system default .bashrc

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

if [ -f $olddir/.bashrc ]; then
    . $olddir/.bashrc
fi