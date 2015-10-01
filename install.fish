#!/usr/bin/env fish

if test ! -e ~/.fish
  git clone --recursive https://github.com/mquinnv/fish-profile.git .fish
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

if test -e ~/.local/share/omf
  cd ~/.local/share/omf
  git pull
else
  curl -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | sh
end

install vimrc
install vim
install pgclirc
install config/fish/config.fish

fish -c "omf install"
fish -c "set -U fish_key_bindings fish_default_key_bindings"
