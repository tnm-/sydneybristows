: '
GENERIC#

Add the following to ~/.bash_aliases file or to the end of ~/.bashrc to enable the aliases
  defined or referenced here, assuming that your .bash folder is added to ~ (a.k.a. $HOME or /home/<linux-username>)

--- Cut from after this line ---

if [ -f ~/.bash/.bash_aliases ]; then
    . ~/.bash/.bash_aliases
fi

--- to before this line ---

'

function h() # [Generic] Help - list all custom aliases, functions and cheat sheets,
#           Filtered by optional <input>; like "docker", "k8s", "kind" and so on...#
{
        if [ $# -eq 0 ]; then
                FILTER="$"                                   
        else
                FILTER=$1
        fi
        # filter from all the files all the lines that:
        # start with the word alias (no whitespace before), or
        # contain a pair of empty paranthesis (as function definitions do), or
        # end with the hashmark character (no whitespace after). <= This last one is used for the cheat sheet.
        # The output is formatted into a table, where the columns in the input are separator by a hashmarks,
        # As a sideeffect the hashmarks are also swallowed. (The cheat sheet hashmarks create empty/invisible columns)
        cat $HOME/.bash/.bash* | egrep "^alias|[(][)]|#$" | grep -i --color=never $FILTER | column -t -s "#"
}


function tt() # [Generic] Set the title of the terminal window to <input>
{
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# enable Docker commands
if [ -f $HOME/.bash/.bash_docker ]; then
    . $HOME/.bash/.bash_docker
fi

# enable Git commands
if [ -f $HOME/.bash/.bash_git ]; then
    . $HOME/.bash/.bash_git
fi

# enable K8s commands
if [ -f $HOME/.bash/.bash_k8s ]; then
    . $HOME/.bash/.bash_k8s
fi

# enable Kind commands
if [ -f $HOME/.bash/.bash_kind ]; then
    . $HOME/.bash/.bash_kind
fi

#
