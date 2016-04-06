# Bash aliases
alias al="vim ~/.aliases.bash"
alias aal="atom ~/.aliases.bash"
alias rbp="source ~/.bash_profile"
alias bp="vim ~/.bash_profile"
alias abp="atom ~/.bash_profile"
alias ..="cd .."
alias la="l -a"
alias ll="l"
alias aa="atom ."
alias aad="atom --dev ."
alias :q="exit"
alias path="echo $PATH | tr : '\n'"
alias h="heroku"
alias fetch="exercism fetch elixir"
alias submit="exercism submit"
alias 2dotfiles="cd ~/dotfiles"
function mkcd {
  mkdir $1
  cd $1
}

function op {
  open http://$1
}
function swap {
  local TMPFILE=tmp.$$
  mv "$1" $TMPFILE
  mv "$2" "$1"
  mv $TMPFILE "$2"
}

alias code="cd ~/code"

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
alias gs="git status && echo -e '\033[32mHave you run your tests?'"
alias gd="git diff --patience"
alias gc="git checkout"
alias gst="git stash"
alias gr="git reset"
alias gb="git branch"
alias ga="git add"
alias gh="git log --pretty=format:\"%Cgreen%h%Creset %Cblue%ad%Creset %s%C(yellow)%d%Creset %Cblue[%an]%Creset\" --graph --date=short"
alias gpu="git pull"
alias gphm="git push heroku master"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gds="git diff --patience --staged"
alias gcm="git commit -m"
alias ghpages="git push origin master:gh-pages"
alias 2ghpages="open http://dalexj.github.io/$(basename $(pwd))"

function ghub {
  ruby ~/.ruby_scripts/ghub.rb
}
function gp {
  git push -u origin $(parse_git_branch)
}
function parse_git_branch {
  ruby ~/.ruby_scripts/parse_git_branch.rb
}
function gbl {
  ruby ~/.ruby_scripts/git_diff_blacklister.rb
}
function gdd {
  gd $(gbl)
}
function gaa {
  ga $(gbl)
}

# Rails/Ruby aliases
alias cov="open coverage/index.html"
function devlog {
  tail -$1 log/development.log
}

alias whocares="bundle exec rake db:test:prepare"
alias routes="bundle exec rake routes"
alias uni="open http://localhost:8080/; unicorn"
alias rak="bundle exec rake"
alias rc="rails c"
alias pr="pry"
alias rs="(sleep 4 && open http://localhost:3000/ &); rails s"
alias dbmig="bundle exec rake db:migrate"
alias dbset="bundle exec rake db:setup"
alias be="bundle exec"
alias rspe="bundle exec rspec"
alias server="ruby -e 'require %q(sinatra); set :public_folder, %q(.); set :bind, %q(0.0.0.0)'"

# Elixir/Mix/Phoenix aliases
alias ms="mix phoenix.server"
alias mc="iex -S mix"

# npm
alias fixnpm="rm -r node_modules && npm install"
function ne { # bundle exec for node
  ./node_modules/.bin/$1 "${@:2}"
}

# python
alias djrs="python manage.py runserver"
