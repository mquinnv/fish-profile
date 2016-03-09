set fisher_home ~/.local/share/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

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

function fuck -d "Correct your previous console command"
  set -l exit_code $status
  set -l fucked_up_command $history[1]
  env TF_ALIAS=fuck PYTHONIOENCODING=utf-8    thefuck $fucked_up_command | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    if test $exit_code -ne 0
      history --delete $fucked_up_command
      history --merge ^ /dev/null
      return 0
    end
  end
end
function fish_greeting
end
function fish_vi_key_bindings_local
  fish_vi_key_bindings
  bind -e -M insert \cc
  bind -M insert -m insert \cc 'commandline ""'
end
set -g fish_key_bindings fish_vi_key_bindings_local
