#!/usr/bin/env fish

if test ! -e ~/.fish
  git clone --recursive git@github.com:mquinnv/fish-profile.git .fish
else
  cd ~/.fish
  git pull
end
git submodule update --init --recursive

echo "(Re-)linking "
function install
  set dot .$argv
  test -e ~/$dot
  and rm -rf ~/$dot
  ln -s ~/.fish/$argv ~/$dot
end

if test -e ~/.oh-my-fish
  cd ~/.oh-my-fish
  git pull
else
  curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish
end

install vimrc
install vim
install config/fish/config.fish

fish -c "omf install"
fish -c "set -U fish_key_bindings fish_default_key_bindings"
