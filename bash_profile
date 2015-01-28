# PATH editing
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export GOPATH="/Users/alex/go"
export PATH="$PATH:$GOPATH/bin"

# iTerm profile changer
function color {
  echo -e "\033]50;SetProfile=$1\a"
}

2gem () {
  cd "$(dirname $(gem which $1))"
}

# compile and run java file at the same time
function jav {
  javac -g $1
  file=$1
  filenoext=${file%%.*}
  java "$(tr '[:lower:]' '[:upper:]' <<< ${filenoext:0:1})${filenoext:1}"
}


# sources
if [ -f ~/.secrets.bash ];
  then
  source ~/.secrets.bash
fi
source ~/.aliases.bash

# my prompt builder
function ruby_prompt {
  PS1=$(ruby ~/.ruby_scripts/prompt.rb)
}

PROMPT_COMMAND='ruby_prompt'
