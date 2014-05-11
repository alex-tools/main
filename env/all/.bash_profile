umask 027

function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\e[32m[\t]\e[0m \u@\h\e[33m [\w]\e[0m \$(parse_git_branch)\n> "

#general
alias ds='du -m  | grep -v "\/.*\/"'
alias l='ls -alF'

#SSH helpers
alias sssh='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'