export CLICOLOR=1

export LSCOLORS=GxFxCxDxBxegedabagaced

export GOROOT=/usr/local/go

export PATH=~/bin:/usr/local/git/bin:$GOROOT/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

eval "$(direnv hook bash)"
