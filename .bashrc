export GIT_PS1_SHOWDIRTYSTATE=1
function prompt {
    local BLACK="\[\033[0;30m\]"
    local BLACKBOLD="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local REDBOLD="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local GREENBOLD="\[\033[1;32m\]"
    local YELLOW="\[\033[0;33m\]"
    local YELLOWBOLD="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BLUEBOLD="\[\033[1;34m\]"
    local PURPLE="\[\033[0;35m\]"
    local PURPLEBOLD="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local CYANBOLD="\[\033[1;36m\]"
    local WHITE="\[\033[0;37m\]"
    local WHITEBOLD="\[\033[1;37m\]"
    export PS1="$YELLOW[\w]$CYAN\$(__git_ps1)\[\033[00m\] $ "
}
prompt

eval "$(rbenv init -)"

alias ls='ls -G'
alias occs='ssh oshoham@occs.oberlin.edu'
alias be="bundle exec"
alias clean_git_branches='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

set -o vi

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export EDITOR="subl -w"
export GIT_EDITOR="vim"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source /usr/local/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
export AWS_ACCESS_KEY_ID=AKIAJSP3QYRJEJERWL6A
export AWS_SECRET_ACCESS_KEY=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
export PROD_AWS_ACCESS_KEY_ID=AKIAIA4ROLPOQWKQIZJA 
export PROD_AWS_SECRET_ACCESS_KEY=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

export OPSCODE_USER=oshoham

ulimit -n 2048

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

_git_delete () {
    __gitcomp_nl "$(__git_refs)"
}

# Automatically activate Git projects' virtual environments based on the
# directory name of the project. Virtual environment name can be overridden
# by placing a .venv file in the project root with a virtualenv name in it
function workon_cwd {
    # Check that this is a Git repo
    GIT_DIR=`git rev-parse --git-dir 2> /dev/null`
    if [ $? == 0 ]; then
        # Find the repo root and check for virtualenv name override
        GIT_DIR=`\cd $GIT_DIR; pwd`
        PROJECT_ROOT=`dirname "$GIT_DIR"`
        ENV_NAME=`basename "$PROJECT_ROOT"`
        if [ -f "$PROJECT_ROOT/.venv" ]; then
            ENV_NAME=`cat "$PROJECT_ROOT/.venv"`
        fi
        # Activate the environment only if it is not already active
        if [ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]; then
            if [ -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]; then
                workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
            fi
        fi
    elif [ $CD_VIRTUAL_ENV ]; then
        # We've just left the repo, deactivate the environment
        # Note: this only happens if the virtualenv was activated automatically
        deactivate && unset CD_VIRTUAL_ENV
    fi
}

# New cd function that does the virtualenv magic
function venv_cd {
    cd "$@" && workon_cwd
}

alias cd="venv_cd"

export NVM_DIR="/Users/orenshoham/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export GOROOT="/usr/local/opt/go/libexec"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$GOROOT/bin"

eval "$(direnv hook bash)"


. /Users/orenshoham/torch/install/bin/torch-activate


. /Users/orenshoham/torch/install/bin/torch-activate
