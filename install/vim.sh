#!/bin/bash


echo "Installing vim plugins ..."

DOTFILES=~/.dotfiles
VIMDIR=$DOTFILES/vim
VIMRC=~/.vimrc1


# ------------------------------ 
#  Create vim directory 
# ------------------------------ 
if [ ! -d $VIMDIR/autoload ]; then
    mkdir -p $VIMDIR/autoload
fi
if [ ! -d $VIMDIR/bundle ]; then
    mkdir -p $VIMDIR/bundle
fi
if [ ! -d $VIMDIR/colors ]; then
    mkdir -p $VIMDIR/colors
fi
if [ ! -d ~/.vim-tmp ]; then
    mkdir -p ~/.vim-tmp
fi

# ------------------------------ 
#  Install Plugins 
# ------------------------------ 
#cd $VIMDIR && git init

# Install pathogen
# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    # curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd $VIMDIR/bundle

# Pathogen plugin manager
git submodule add https://github.com/tpope/vim-pathogen.git

# Genutils
git submodule add https://github.com/vim-scripts/genutils.git

# Fuzzy file finder
git submodule add https://github.com/kien/ctrlp.vim

# Powerline fonts
git submodule add https://github.com/powerline/fonts.git

# Mark brower
# git submodule add https://github.com/vim-scripts/Marks-Browser.git

# Python mode
git submodule add https://github.com/klen/python-mode.git

# Autocomplete
git submodule add https://github.com/msanders/snipmate.vim.git

# Syntax check
git submodule add https://github.com/scrooloose/syntastic.git

# Move fast in vim
git submodule add https://github.com/easymotion/vim-easymotion.git

# Legacy power plugin (new powerline conflicts with ctrlp plugin)
git submodule add https://github.com/Lokaltog/vim-powerline.git

# Git
git submodule add https://github.com/tpope/vim-fugitive.git

# Surround
git submodule add https://github.com/tpope/vim-surround.git

# Sensible
git submodule add https://github.com/tpope/vim-sensible.git

# Commentary
git submodule add https://github.com/tpope/vim-commentary.git

# Repeat
git submodule add https://github.com/tpope/vim-repeat.git

# Tabline
git submodule add https://github.com/mkitt/tabline.vim.git

# Tagbar
git submodule add https://github.com/majutsushi/tagbar.git

# Nerdtree
git submodule add https://github.com/scrooloose/nerdtree.git

# Supertab (Conflicts with YCM)
# git submodule add https://github.com/ervandew/supertab.git

# YouCompleteMe
git submodule add https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
echo "Installing YCM .."
# ./install.py --all
cd ..

# Perforce
git submodule add https://github.com/vim-scripts/perforce.vim.git

# Color Scheme
git submodule add https://github.com/altercation/vim-colors-solarized

# ListToggle
git submodule add https://github.com/Valloric/ListToggle.git


# ------------------------------ 
# Link .vimrc
# ------------------------------ 
ln -s $DOTFILES/vim/vimrc.symlink $VIMRC

