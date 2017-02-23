export DOTFILES_DIR=~/dotfiles
source $DOTFILES_DIR/vars
#used to run dotfiles files with keeping system default .bashrc

if [ -f $dotfiles_olddir/.bashrc ]; then
    echo "[DotFiles] Using old dotfile $dotfiles_olddir/.bashrc"
    . $dotfiles_olddir/.bashrc
fi

if [ -f $dotfiles_dir/aliasrc ]; then
    . $dotfiles_dir/aliasrc
fi