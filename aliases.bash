# Bash aliases
alias al="vim ~/.aliases.bash"
alias rbp="source ~/.bash_profile"
alias bp="vim ~/.bash_profile"
alias abp="atom ~/.bash_profile"
alias notes="vim ~/.notes"
alias ..="cd .. ; echo I added it for you Josh"
alias proj="cd ~/turing/projects"
alias la="l -a"
function mkcd {
  mkdir $1
  cd $1
}

function op {
  open http://$1
}

alias compjava="ruby ~/.ruby_scripts/java.rb"
alias fetch="exercism fetch ruby"

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias l="ls -lFGgohq"

# Misspellings aliases
alias cd..="cd .."
alias aotm="atom"

# Git aliases
alias gs="git status && echo 'Have you ran your tests?'"
alias gd="git diff --patience"
alias gc="git checkout"
alias gb="git branch"
alias ga="git add"
alias gh="git hist -5"
alias gds="git diff --patience --staged"
alias gcmn="git commit -m" # git commit no twitter
function gcm {             # git commit with twitter
  git commit -m "$1"
  ruby -e 'require %(jumpstart_auth);JumpstartAuth.twitter.update(ARGV.join " ")' $1
}
function ghub {
  open $(git config --get remote.origin.url)
}
function gp {
  git push -u origin $(parse_git_branch)
}

# Rails/Ruby aliases
alias cov="open coverage/index.html"
function devlog {
  tail -$1 log/development.log
}
alias routes="bundle exec rake routes"
alias uni="open http://localhost:8080/; unicorn"
alias rak="bundle exec rake"
alias rc="rails c"
alias dbmig="bundle exec rake db:migrate"
alias dbset="bundle exec rake db:setup"
alias be="bundle exec"

# Gosu only uses ruby 1.9
alias gosu="~/.rvm/gems/ruby-1.9.3-p547/wrappers/ruby"

# open up twitter.com
alias twitter="open https://twitter.com/"

# trevor
alias trev="ruby ~/trevor.rb"

# alias rc="rails runner 'ActiveRecord::Base.logger=ActiveSupport::Logger.new(STDOUT);require %(pry);Pry.start'"

# jorge
alias again="git clone https://github.com/JumpstartLab/blogger_advanced.git"

# go aliases
alias fmtall="gofmt -w *"
alias fmtal="gofmt -w *"
alias grun="go run *"
