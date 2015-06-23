#!/usr/bin/env fish

if test ! -e ~/.fish
  echo "Checking out .fish"
  git clone --recursive git@git:/git/fish .fish
else
  cd ~/.fish
end
git submodule update --init --recursive

echo "Linking "
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
