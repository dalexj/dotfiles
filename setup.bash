ln -s $PWD/bash_profile ~/.bash_profile
ln -s $PWD/aliases.bash ~/.aliases.bash
ln -s $PWD/rspec ~/.rspec
ln -s $PWD/pryrc ~/.pryrc
ln -s $PWD/psqlrc ~/.psqlrc
# ln -s $PWD/mix_autocomplete/mix_autocomplete.sh ~/.mix-autocomplete.sh
ln -s $PWD/hk-bash-completion.sh ~/.hk-bash-completion.sh

if [ ! -d ~/.ruby_scripts ]; then
  ln -s $PWD/ruby_scripts ~/.ruby_scripts
fi

# git submodule update --init --recursive
# git submodule foreach git pull origin master
