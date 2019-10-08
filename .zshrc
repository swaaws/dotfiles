# =============================================================================
# Filename: ~/.zshrc.sh
# Author: swaaws
# License: GPL3.14 License
# Last Change: 20190/10/3.
# =============================================================================
export ZSH=~"/.oh-my-zsh"


ZSH_THEME="robbyrussell"


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Load all of the config files in ~/oh-my-zsh that end in .zsh
for config_file (~/.zsh/lib/*.zsh) source $config_file


plugins=(git)


source $ZSH/oh-my-zsh.sh

