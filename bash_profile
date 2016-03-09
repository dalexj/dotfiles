# PATH editing
export PATH
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export GOPATH="$HOME/code/go"
export PATH="$GOPATH/bin:$PATH"

# python virtualenv
export WORKON_HOME="~/python_environments"
export VIRTUALENV_DISTRIBUTE=1
export PYTHONDONTWRITEBYTECODE=1
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# rbenv
which rbenv >/dev/null && eval "$(rbenv init -)"

2gem () {
  cd "$(dirname $(gem which $1))"
}

# sources
source ~/.aliases.bash

# my prompt builder
function ruby_prompt {
  PS1=$(ruby ~/.ruby_scripts/prompt.rb)
}

function go_prompt {
  PS1=$(~/dotfiles/go_scripts/prompt)
}
function setbg {
  export PROMPT_BG_COLOR=$1
}
function settext {
  export PROMPT_TEXT_COLOR=$1
}

setbg 6
settext 3
# PROMPT_COMMAND='ruby_prompt'
PROMPT_COMMAND='go_prompt'

# my mix autocompelte script
if [ -f ~/.mix-autocomplete.sh ]; then
  source ~/.mix-autocomplete.sh
fi
# hk autocomplete
if [ -f ~/.hk-bash-completion.sh ]; then
  source ~/.hk-bash-completion.sh
fi
# git autocompletion for branch names
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
  __git_complete gc _git_checkout
  __git_complete gb _git_branch
  __git_complete gd _git_diff
fi
