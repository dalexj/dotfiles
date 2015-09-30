mkdir -p ~/.atom

if [ -a ~/.atom/keymap.cson ]; then
  mv ~/.atom/keymap.cson ~/.atom/keymap.cson.old
fi
if [ -a ~/.atom/snippets.cson ]; then
  mv ~/.atom/snippets.cson ~/.atom/snippets.cson.old
fi
if [ -a ~/.atom/styles.less ]; then
  mv ~/.atom/styles.less ~/.atom/styles.less.old
fi

ln -s $PWD/atom/keymap.cson ~/.atom/keymap.cson
ln -s $PWD/atom/snippets.cson ~/.atom/snippets.cson
ln -s $PWD/atom/styles.less ~/.atom/styles.less
