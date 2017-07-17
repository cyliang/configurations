export PATH=$HOME/bin:$HOME/usr/bin:$HOME/.local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export LC_CTYPE=en_US.UTF-8

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_DIR_HOME_BACKGROUND='033'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='033'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='033'

ENABLE_CORRECTION="true"

plugins=(git screen catimg)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
