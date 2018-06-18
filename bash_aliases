PROMPT_DIRTRIM=2
alias tmux='TERM=xterm-256color /usr/bin/tmux'
alias ranger='PAGER=less ranger'
alias vimtex='vim --servername VIM "+set nonumber" "+set spell" -p'
alias matlabhl='matlab -nosplash -nodesktop -nodisplay'
alias matl='matlab -nosplash -nodesktop'
alias lc='ls --color=never'
alias la='ls -l --almost-all --human-readable'
alias ll='ls -1 --classify '
alias l='ls --classify'
alias clock='tty-clock -cC 4'
alias t='todo-txt -d ~/.todo-txt/config'
alias shorttree='tree --filelimit 10 -L 4'

alias sless='LESSOPEN="| highlight --out-format=ansi %s" less -MR '

PATH=$PATH:~/bioformats


# Ranger snippets #
# Compatible with ranger 1.4.2 through 1.7.*
#
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.

function ranger-cd {
    tempfile="$(mktemp)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# Change the prompt when you open a shell from inside ranger
#
# Add this line to your .bashrc for it to work.

[ -n "$RANGER_LEVEL" ] && PS1="$PS1"'(ranger) '
