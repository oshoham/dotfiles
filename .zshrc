########################################################################
# oh-my-zsh
########################################################################

export ZSH="/Users/orenshoham/.oh-my-zsh"

ZSH_THEME="oren"

plugins=(colorize docker direnv gitfast vi-mode keychain)

zstyle :omz:plugins:keychain agents ssh
zstyle :omz:plugins:keychain identities id_rsa

source $ZSH/oh-my-zsh.sh

########################################################################
# nvm
########################################################################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# automatically switch node versions based on local .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

########################################################################
# pyenv
########################################################################

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

########################################################################
# vi-mode cursor shape
########################################################################

# reference: https://archive.emily.st/2013/05/03/zsh-vi-cursor/
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n -- "\E]50;CursorShape=0\C-G";;  # block cursor
        viins|main) print -n -- "\E]50;CursorShape=1\C-G";;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- "\E]50;CursorShape=0\C-G"  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

########################################################################
# iTerm2 shell integration
########################################################################

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

########################################################################
# misc. exports
########################################################################

export GIT_PS1_SHOWDIRTYSTATE=1
export ZSH_COLORIZE_STYLE="monokai"
export EDITOR=vim
export GIT_EDITOR=vim
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH="/usr/local/sbin:$PATH"

########################################################################
# aliases
########################################################################

alias clean_git_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias less=cless
alias cat=ccat

