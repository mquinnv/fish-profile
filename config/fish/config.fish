# Path to your oh-my-fish.
set -g OMF_PATH $HOME/.local/share/omf

### Configuration required to load oh-my-fish ###
# Note: Only add configurations that are required to be set before oh-my-fish is loaded.
# For common configurations, we advise you to add them to your $OMF_CONFIG/init.fish file or
# to create a custom plugin instead.

# # Load oh-my-fish configuration.
 source $OMF_PATH/init.fish

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
  echo -n "$host:"
  if [ $_ = 'fish' ]
    echo (pwd)
  else
    echo $_
  end
end

function update.fish
  ~/.fish/install.fish
end

function aj
  pgcli -h amberjack amberjack
end

alias amberjack aj

function cg2
  pgcli -h grothe cg2
end
function telecom
  pgcli telecom
end

function sudo
  if test "$argv" = !!
    eval command sudo $history[1]
  else
    command sudo $argv
  end
end

function jdk
  set -g -x JAVA_HOME (/usr/libexec/java_home -v $argv[1])
end
