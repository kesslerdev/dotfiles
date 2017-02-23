#!/bin/bash
echo "[Kessler's Dotfiles'] Update $DOTFILES_DIR"
source $DOTFILES_DIR/vars
#go to dotfiles directory
cd $dotfiles_dir
# Check state of directory
git diff-index --quiet HEAD -- || echo "changes detected Abort"; exit 1
#run repo update from master
echo $DOTFILES_DIR
#ln -s  new files in HOME
exit 1

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $dotfiles_files; do
    #check if is already a symlink that point to $dotfiles_dir/$file to avoid replace
    echo "Moving existing dotfile .$file from ~ to $dotfiles_olddir"
    mv ~/.$file $dotfiles_olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles_dir/$file ~/.$file
done