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

if [ -d $HOME/.yarn/bin ]; then
    export PATH="$HOME/.yarn/bin:$PATH"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
if [ -d $HOME/.rvm/bin ]; then
    export PATH="$PATH:$HOME/.rvm/bin"
fi

if [ ! -d $HOME/.hist ]; then
    mkdir $HOME/.hist
fi

export HISTFILE="$HOME/.hist/.zsh_history"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
