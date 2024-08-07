# Bash aliases
alias al="vim ~/.aliases.bash"
alias cal="code ~/.aliases.bash"
alias rbp="source ~/.bash_profile"
alias ral="source ~/.aliases.bash"
alias bp="vim ~/.bash_profile"
alias cbp="code ~/.bash_profile"
alias ..="cd .."
alias la="l -a"
alias ll="l"
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

# fancy ls command
# -l  long format
# -F  / after dirs, * after exe, @ after symlink
# -G  colorize
# -g suppress owner
# -o suppress group
# -h humanize sizes
# -q print nongraphic chars as question marks
alias l="ls -lFGgohq"
# alias l="exa -l"

# Misspellings aliases
alias cd..="cd .."
# Git aliases
# run this to not show a/file b/file:
#   git config --global diff.noprefix true
alias gs="git status && echo -e '\033[32mHave you run your tests?'"
alias gd="git diff --patience --no-prefix"
alias gc="git checkout"
alias gst="git stash"
alias gr="git reset"
alias gb="git branch"
alias ga="git add"
alias gcp="git cherry-pick"
alias gcont="git rebase --continue"
alias ghist="git log --pretty=format:\"%Cgreen%h%Creset %Cblue%ad%Creset %s%C(yellow)%d%Creset %Cblue[%an]%Creset\" --graph --date=short"
alias gpu="git pull"
alias gpurb="git pull --rebase"
alias gphm="git push heroku master"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"
alias gds="git diff --patience --staged --no-prefix"
alias gcm="git commit -m"
alias gcb="git checkout -b"
alias master="git checkout master && git pull && bundle install && bundle exec rails db:migrate && bundle exec rails db:migrate RAILS_ENV=test && bundle exec rails db:migrate:with_data"
alias main="git checkout main && git pull && bundle install && bundle exec rails db:migrate && bundle exec rails db:migrate RAILS_ENV=test && bundle exec rails db:migrate:with_data && bundle clean --force"
alias ghpages="git push origin master:gh-pages"
alias 2ghpages="open http://dalexj.github.io/$(basename $(pwd))"

function gdo {
  git diff --patience --no-prefix $(git rev-parse --abbrev-ref --symbolic-full-name @{u})
}
function gri {
  git rebase -i HEAD~$1
}
function ghub {
  gh browse
}
function gp {
  git push -u origin $(parse_git_branch) $@
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

# rollback a version
function dbdown {
  if [ "$#" -ne 1 ]; then
      echo "Arguments error: Give the migration number you want to roll back"
      return 0
  fi
  bundle exec rails db:migrate:down:primary VERSION=$1 && bundle exec rails db:migrate:down:primary VERSION=$1 RAILS_ENV=test
}
function dbdowndev {
  if [ "$#" -ne 1 ]; then
      echo "Arguments error: Give the migration number you want to roll back"
      return 0
  fi
  bundle exec rails db:migrate:down:primary VERSION=$1
}

alias whocares="bundle exec rake db:test:prepare"
alias routes="bundle exec rails routes"
alias uni="open http://localhost:8080/; unicorn"
alias rak="bundle exec rake"
alias rc="rails c"
alias cop="bundle exec rubocop"
alias pr="pry"
alias rs="(sleep 4 && open http://localhost:3000/ &); rails s"
alias dbmig="bundle exec rails db:migrate && bundle exec rails db:migrate RAILS_ENV=test"
alias dbrollback="bundle exec rails db:rollback && bundle exec rails db:rollback RAILS_ENV=test"
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
alias bw="./node_modules/.bin/brunch watch"

# python
alias djrs="python manage.py runserver"
alias dj="python manage.py"

function notes {
  code ~/notes/$(date '+%Y_%m_%d')_notes.txt
}
