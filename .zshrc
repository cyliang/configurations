export PATH=$HOME/bin:$HOME/usr/bin:$HOME/.local/bin:$PATH
export ZSH=/home/cyliang/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_DIR_HOME_BACKGROUND='033'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='033'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='033'

ENABLE_CORRECTION="true"

plugins=(git screen vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
