ln -s $PWD/bash_profile ~/.bash_profile
ln -s $PWD/aliases.bash ~/.aliases.bash
ln -s $PWD/vimrc ~/.vimrc
ln -s $PWD/rspec ~/.rspec
ln -s $PWD/mix-autocomplete.sh ~/.mix-autocomplete.sh

if [ ! -d ~/.ruby_scripts ]; then
  ln -s $PWD/ruby_scripts ~/.ruby_scripts
fi

if [ ! -d ~/.vim ]; then
  ln -s $PWD/vim ~/.vim
fi

# git submodule update --init --recursive
# git submodule foreach git pull origin master
