export DOTFILES_DIR=~/dotfiles
source $DOTFILES_DIR/vars
#used to run dotfiles files with keeping system default .zshrc

if [ -f $dotfiles_olddir/.zshrc ]; then
    echo "[DotFiles] Using old dotfile $dotfiles_olddir/.zshrc"
    . $dotfiles_olddir/.zshrc
fi

if [ -f $dotfiles_dir/aliasrc ]; then
    . $dotfiles_dir/aliasrc
fi