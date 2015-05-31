# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

ulimit -m 2048

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# enable completion
source /etc/profile.d/bash_completion.sh

export EDITOR="vim"
set -o vi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python2.7/site-packages/"
export PYTHONPATH="/usr/local:$PYTHONPATH"
export PATH="${PATH}:${HOME}/bin"

# Put your fun stuff here.
export RHOME="${HOME}/Work/UofA/Research"
export COMPUCELL_IU_REMOTE="git://github.iu.edu/Biocomplexity/CompuCell3D.git"
export LD_LIBRARY_PATH=/usr/local/RR/lib

export COMPUCELL3D_MAJOR_VERSION=3
export COMPUCELL3D_MINOR_VERSION=7
export COMPUCELL3D_BUILD_VERSION=2

export PREFIX_CC3D=/usr/local/compucell_${COMPUCELL3D_MAJOR_VERSION}${COMPUCELL3D_MINOR_VERSION}${COMPUCELL3D_BUILD_VERSION}
export PREFIX_VTK=/usr/local/lib

export LD_LIBRARY_PATH=${PREFIX_CC3D}/lib/:$LD_LIBRARY_PATH
export COMPUCELL3D_PLUGIN_PATH=${PREFIX_CC3D}/lib/CompuCell3DPlugins
export COMPUCELL3D_STEPPABLE_PATH=${PREFIX_CC3D}/lib/CompuCell3DSteppables
export LD_LIBRARY_PATH=${PREFIX_CC3D}/lib/python:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${COMPUCELL3D_PLUGIN_PATH}:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${COMPUCELL3D_STEPPABLE_PATH}:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib64/qt4:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${PREFIX_VTK}/vtk-5.10:$LD_LIBRARY_PATH
export SWIG_LIB_INSTALL_DIR=${PREFIX_CC3D}/lib/python
export PYTHON_MODULE_PATH=${PREFIX_CC3D}/pythonSetupScripts

if [ "$TERM" != "dump" ]; then
    export LS_OPTIONS="--color=auto"
    eval $(dircolors -b)
fi

source $HOME/.aliases

bind -m vi-insert '"\C-e":shell-expand-line'
bind -m vi-command '"\C-e":shell-expand-line'
bind -m vi-insert '"\ee":history-and-alias-expand-line'
bind -m vi-insert '"\eE":history-and-alias-expand-line'
bind -m vi-command '"\ee":history-and-alias-expand-line'
bind -m vi-command '"\eE":history-and-alias-expand-line'
bind -m vi-insert '"\ei":complete-filename'
bind -m vi-insert '"\eI":complete-filename'
bind -m vi-insert '"\e\t":dynamic-complete-history'
bind -m vi-insert '"\eq":dabbrev-expand'

bind -m vi-insert -x '"\C-x\C-p":readline_before_accept_line'
bind -m vi-insert '"\C-x\C-n":accept-line'
bind -m vi-insert '"\n":"\C-x\C-p\C-x\C-n"'

readline_before_accept_line() {
    printf '\n...%s:%s\n' "$READLINE_POINT" "$READLINE_LINE"
}

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f "$1" ] ; then
        NAME=${1%.*}
        #mkdir $NAME && cd $NAME
        case "$1" in
          *.tar.bz2)   tar xvjf ./"$1"    ;;
          *.tar.gz)    tar xvzf ./"$1"    ;;
          *.tar.xz)    tar xvJf ./"$1"    ;;
          *.lzma)      unlzma ./"$1"      ;;
          *.bz2)       bunzip2 ./"$1"     ;;
          *.rar)       unrar x -ad ./"$1" ;;
          *.gz)        gunzip ./"$1"      ;;
          *.tar)       tar xvf ./"$1"     ;;
          *.tbz2)      tar xvjf ./"$1"    ;;
          *.tgz)       tar xvzf ./"$1"    ;;
          *.zip)       unzip ./"$1"       ;;
          *.Z)         uncompress ./"$1"  ;;
          *.7z)        7z x ./"$1"        ;;
          *.xz)        unxz ./"$1"        ;;
          *.exe)       cabextract ./"$1"  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "'$1' - file does not exist"
    fi
fi
}
