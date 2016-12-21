#!/bin/bash

# makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles


## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
# list of files to link
files="inputrc Xresources bash_aliases tmux.conf "
files+="vimrc vim/spell/en.utf-8.add vim/spell/de.utf-8.add "
files+="gitconfig gitignore_global "
files+="config/redshift.conf config/zathura/zathurarc "
files+="config/mc/ini config/mc/panels.ini "
files+="xscreensaver"


## Take care of directories

#create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

#change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"


## Backup old files and make symlinks

#move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
nMoved=0
for file in $files; do
    if [ ! -L ~/.$file ]; then
        if [ -e ~/.$file ]; then
            echo -n "Moving old .$file to $olddir, "
            mv ~/.$file ~/dotfiles_old/
            ((nMoved+=1))
        fi
        echo "Creating symlink to .$file"
        ln -s $dir/$file ~/.$file
    else
        echo "Found existing symlink to .$file"
    fi
done
if [ "$nMoved" -ge 1 ]; then
    echo "Moved $nMoved existing dotfiles from ~ to $olddir."
fi

## Install vim plugins with Vundle
vundlePath="~/.vim/bundle/Vundle.vim"
if [ ! -e $vundlePath ]; then
    echo -n "Installing vim plugins... "
    git clone https://github.com/VundleVim/Vundle.vim.git $vundlePath
    vim +PluginInstall +qall
    echo "done"
fi
