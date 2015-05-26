# zsim
export PYTHONPATH=/data/sanchez/tools/pymodules/lib/python2.7/site-packages
ZSIMDEPSROOT=/data/sanchez/benchmarks/zsim-deps
export PINPATH=$ZSIMDEPSROOT/pin/
export LIBCONFIGPATH=$ZSIMDEPSROOT/libconfig-1.4.8/inst/
export POLARSSLPATH=$ZSIMDEPSROOT/polarssl-1.1.4/
export DRAMSIMPATH=$ZSIMDEPSROOT/DRAMSim2/
export ZSIMAPPSPATH=/data/sanchez/benchmarks/zsim-apps/

# Gurobi
export TOOLS_HOME=/data/sanchez/tools
export GUROBI_HOME=$TOOLS_HOME/gurobi/gurobi550/linux64
export PATH=$PATH:$GUROBI_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GUROBI_HOME/lib
export GRB_LICENSE_FILE=$TOOLS_HOME/gurobi/licenses/$USER/$HOSTNAME.lic

# Armadillo
export ZSIMARMADILLOPATH=$ZSIMDEPSROOT/armadillo/

# tlmgr
export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux

# color
alias less='less --RAW-CONTROL-CHARS'
export LS_OPTS='--color=auto'
alias ls='ls ${LS_OPTS}'
alias c='clear'

## Use a long listing format ##
alias ll='ls -la'
 
## Show hidden files ##
alias l.='ls -d .* --color=auto'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# install  colordiff package :)
alias diff='colordiff'

# handy short cuts #
alias h='history'
alias j='jobs -l'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## this one saved by butt so many times ##
alias wget='wget -c'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'
 
# top is atop, just like vi is vim
alias top='atop'

alias bashrc='vim ~/.bashrc && source ~/.bashrc'


