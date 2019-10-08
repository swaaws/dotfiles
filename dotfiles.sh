#!/bin/sh
# =============================================================================
# Filename: ~/dotfiles.sh
# Author: swaaws
# License: GPL3.14 License
# Last Change: 20190/10/3 02:11.
# =============================================================================

# check dependencies
if [ `curl --version | grep -c "."` ]; then
    echo curl found
else
    echo Please install curl
    break
fi
if [ `zsh --version | grep -c "."` ]; then
    echo zsh found
else
    echo Please install zsh
    break
fi
if [ `git --version | grep -c "version"` ]; then
    echo git found
else
    echo Please install git
    break
fi
if [ `tar --version | grep -c "."` ]; then
    echo tar found
else
    echo Please install tar
    break
fi

# go to home "~"
cd ~


# Backup an existing .git folder... its stupid!
if [ -d .git ]; then
    mkdir backup_dot_git
    mv .git backup_dot_git
    tar -cvf backup_dot_git.tar backup_dot_git
    rm -rf backup_dot_git
    echo "Found .git in your Home folder... be careful with big files"
    echo ".git folder moved to backup_dot_git.tar"
fi

# Backup .gitmodules, .vimrc, .zshrc, .vim/, .zsh/
mkdir backup_zsh_vim
if [ -f .gitmodules ]; then
    mv .gitmodules backup_zsh_vim/
fi

if [ -f .vimrc ]; then
    mv .vimrc backup_zsh_vim/
fi

if [ -f .zshrc ]; then
    mv .zshrc backup_zsh_vim/
fi

if [ -d .vim ]; then
    mv .vim backup_zsh_vim/
fi

if [ -d .zsh ]; then
    mv .zsh backup_zsh_vim/
fi

tar -cvf backup_zsh_vim.tar backup_zsh_vim/
rm -rf backup_zsh_vim

# get new dotfiles
git clone https://github.com/swaaws/dotfiles.git temp
cd temp
git submodule init && git submodule update
mv .* ~/
cd ~
if [ `sync --version | grep -c "."` ]; then
    sync
else
    echo sync not found, ok
fi

# cleanup
rm -rf .git
rm -rf temp
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo '"chsh -s $(which zsh)" to set zsh as default sh'

