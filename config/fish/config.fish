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
set -g theme_hostname always
set -g fish_user_paths {/usr,/usr/local,}/{bin,sbin} ~/bin
function prompt_pwd --description 'Print the current working directory, shortened to fit the prompt'
  set -q argv[1]
  and switch $argv[1]
    case -h --help
    __fish_print_help prompt_pwd
    return 0
  end

# This allows overriding fish_prompt_pwd_dir_length from the outside (global or universal) without leaking it
  set -q fish_prompt_pwd_dir_length
  or set -l fish_prompt_pwd_dir_length 1

# Replace $HOME with "~"
  set realhome ~
  set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)

  if [ $fish_prompt_pwd_dir_length -eq 0 ]
  echo $tmp
  else
# Shorten to at most $fish_prompt_pwd_dir_length characters per directory
    if echo $tmp | grep -q -E '^.*sites.*$'
      string replace -ar '.*sites/(.*)' '$1' $tmp
    else
      string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
    end
  end
end
set -gx LC_ALL en_US.UTF-8
