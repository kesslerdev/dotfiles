#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# EASY on line install
# git clone https://github.com/kesslerdev/dotfiles.git ~/dotfiles && cd ~/dotfiles && chmod +x makesymlinks.sh && ./makesymlinks.sh
############################

########## Variables
if [ -z "$DOTFILES_HOMEDIR" ]; then
    export DOTFILES_HOMEDIR=~
fi

if [ -z "$DOTFILES_DIR" ]; then
    export DOTFILES_DIR=$DOTFILES_HOMEDIR/dotfiles
fi

source $DOTFILES_DIR/vars

##########

# create dotfiles_old in homedir
echo "Creating $dotfiles_olddir for backup of any existing dotfiles in ~"
mkdir -p $dotfiles_olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfiles_dir directory"
cd $dotfiles_dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $dotfiles_files; do
    #check if is already a symlink that point to $dotfiles_dir/$file to avoid replace
    echo "Moving existing dotfile .$file from $DOTFILES_HOMEDIR to $dotfiles_olddir"
    mv $DOTFILES_HOMEDIR/.$file $dotfiles_olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles_dir/$file $DOTFILES_HOMEDIR/.$file
done

#echo "installing fzf"

#git clone https://github.com/junegunn/fzf.git ~/.oh-my-zsh/custom/plugins/fzf
#~/.oh-my-zsh/custom/plugins/fzf/install --bin
#git clone https://github.com/Treri/fzf-zsh.git ~/.oh-my-zsh/custom/plugins/fzf-zsh
