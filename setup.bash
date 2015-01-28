ln -s $PWD/bash_profile ~/.bash_profile
if [ ! -d ~/.ruby_scripts ]; then
  ln -s $PWD/ruby_scripts ~/.ruby_scripts
fi
ln -s $PWD/aliases.bash ~/.aliases.bash
