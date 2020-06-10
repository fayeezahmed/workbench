alias grep='grep -inIER --exclude-dir={node_modules,reports,tags,logs,dev,var}'
alias find='find . -path ./node_modules -prune -o -name'
which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
