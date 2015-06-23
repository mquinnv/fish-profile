#!/usr/bin/env fish

set base ~

if test ! -e $base/.fish
  echo "Checking out .fish"
  git clone --recursive git@git:/git/fish .fish
else
  cd ~base/.fish
  git submodule update --recursive
end


echo "Linking "
function install
  set dot .$argv
  test -e $base/$dot
  and rm -rf $base/$dot
  ln -s ~/.fish/$argv $base/$dot
end

if test -e $base/.oh-my-fish
    rm -rf $base/.oh-my-fish
end

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish

install vimrc
install vim
install config/fish/config.fish

fish -c "omf install"
