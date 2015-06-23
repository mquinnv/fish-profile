# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Custom plugins and themes may be added to ~/.oh-my-fish/custom
# Plugins and themes can be found at https://github.com/oh-my-fish/
Theme 'bobthefish'
Plugin 'theme'
Plugin 'brew'
Plugin 'gi'
Plugin 'git-flow'
Plugin 'jump'
Plugin 'node'
Plugin 'ssh'
Plugin 'tab'
Plugin 'vi-mode'

alias dir 'ls -l'
alias su 'sudo su'

function fish_right_prompt
end
switch (uname)
  case Linux
    alias ls 'ls --color'
    alias grep "/bin/grep $GREP_OPTIONS"
    set -e GREP_OPTIONS
    set -g theme_display_user yes
  case Darwin
    alias ls 'gls --color'
end

set host (hostname -s)
if test (id -u) -eq 0 
  set host root@$host
end

function fish_title
  echo -n "$host: "
  if [ $_ = 'fish' ]
    echo (prompt_pwd)
  else
    echo $_
  end
end

function update.fish
  ~/.fish/install.fish
end
