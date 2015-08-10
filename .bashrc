# Alias definitions.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Environment variables

if [ -f ~/.env ]; then
    . ~/.env
fi

# Make command-line better

COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ ! $git_status =~ "working directory clean" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  else
    echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch) "
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit) "
  fi
}

export PS1="\[\033[1;30m\]\u@\h \[\033[01;32m\]\W \[\$(git_color)\]\$(git_branch)\[\033[01;34m\]$ \[\e[0m\]"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
