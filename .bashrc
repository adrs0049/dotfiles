# Bash
export EDITOR='mvim -v -N'

# Subversion
export SVN_EDITOR='mvim -f'

# Git
source /usr/local/git/contrib/completion/git-completion.bash
export GIT_EDITOR='mvim -f -c "au VimLeave * !open -a Terminal"'
export PATH=$PATH:/usr/local/git/bin/

function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "("${ref#refs/heads/}") "
}

function wiki {
 dig +short txt $1.wp.dg.cx
}

function blunderbuss {
  if [ -z "$1" ]; then
    PORT=9393
  else
    PORT=$1
  fi

  IP=`ifconfig | grep -m 1 broadcast | awk '{print $2}'`
  shotgun -s thin -o $IP -p $PORT
}

function sass-watch {
  if [ -z "$3" ]; then
    SASS_IN='all.scss'
    CSS_OUT='all.css'
    SASS_WATCH_PATH='.'
  else
    SASS_IN=$1
    CSS_OUT=$2
    SASS_WATCH_PATH=$3
  fi

puncher "echo \"[\033[1;33m\$(date +%H:%M:%S)\033[1;37m] \
\033[1;37mwrote \033[1;32m$CSS_OUT\033[1;37m\" && \
sass --scss $SASS_IN $CSS_OUT" $SASS_WATCH_PATH
}

# OpenCV
export PYTHONPATH="/usr/local/lib/python2.6/site-packages/:$PYTHONPATH"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/opencv/2.2/lib/pkgconfig"

# NPM
export PATH=$PATH:/usr/local/share/npm/bin

# Homebrew
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# Opt
export PATH=$PATH:/opt/bin

# MySQL
export PATH=/usr/local/mysql/bin:$PATH

# JRuby
export PATH=$PATH:/opt/jruby/bin

# ZenTest
export RSPEC=true
export AUTOTEST=true
export AUTOFEATURE=true

# Colors!
export CLICOLOR=1
export LSCOLORS=HxbxfxdxCxegedafahacad

# Aliases
alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'
alias vim='mvim -v -N'

# Rails
alias ss='script/server'
alias sc='script/console'

# UR
# alias assets='ssh -o TCPKeepAlive=no -o ServerAliveInterval=15 root@assets.ur.se'
# alias urvalet='cd /Users/peter/Work/Athega/UR/urvalet'
# alias ur-thumbnail-generator='cd /Users/peter/Work/Athega/UR/urvalet/ur-thumbnail-generator && mate .'
# alias ur-metadata-cache='cd /Users/peter/Work/Athega/UR/urvalet/ur-metadata-cache/trunk && mate .. && ss -p 3001'
# alias ur-search-frontend='cd /Users/peter/Work/Athega/UR/urvalet/ur-search-frontend/trunk && mate .. && ss'
# alias ur-asset-manager='cd /Users/peter/Work/Athega/UR/urvalet/ur-asset-manager/trunk && mate .. && shotgun ur-asset-manager.rb'
# alias ur-schedule-frontend='sudo /opt/nginx/sbin/nginx && cd /Users/peter/Work/Athega/UR/urvalet/ur-broadcast-services/ && mate . && cd /Users/peter/Work/Athega/UR/urvalet/ur-schedule-frontend/trunk/ && mate .. && ss -p 4000'

alias mongod18='mongod run --config /usr/local/Cellar/mongodb/1.8.0-x86_64/mongod.conf'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
