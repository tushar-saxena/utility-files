# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#paths

export JAVA_HOME=/opt/java-library
export JAVA_OPTS="-XX:MaxPermSize=512m -Xms712m -Xmx1700m -server"
export GROOVY_HOME=/opt/groovy-library
export GRAILS_HOME=/opt/grails-library
export M2_HOME=/opt/maven-library
export IDEA_HOME=/opt/idea-IU

export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$GROOVY_HOME/bin
export PATH=$PATH:$GRAILS_HOME/bin
export PATH=$PATH:$IDEA_HOME/bin
export PATH=$PATH:~/bin

#alias

alias idea="sh /opt/idea-IU/bin/idea.sh"
alias go="gnome-open"
alias install="sudo apt-get install"

#grails
alias gcrap="grails clean;grails -reloading run-app"
alias grap="grails -reloading run-app"
alias gsap="grails stop-app"
alias gdebug="grails -reloading run-app --debug-fork"
alias killgrails="pgrep -f  grails | xargs kill -9"
alias gkill="pkill -9 -f grails"

#git
alias gb="git branch"
alias gchk="git checkout"
alias gm="git merge"
alias gs="git status"
alias gl="git pull"
alias gp="git push"
alias gc="git commit"

#create-drop-database
function createDrop() {
	EXPECTED_ARGS=1
	E_BADARGS=65
	if [ $# -ne $EXPECTED_ARGS ]
	then
		echo "Usage: createDrop [DATABASE_NAME]"
	else
		echo drop database $1";" > /tmp/createDropDB.sql
		mysql --user=root --password=igdefault < /tmp/createDropDB.sql
		echo create database $1";" > /tmp/createDropDB.sql
		mysql --user=root --password=igdefault < /tmp/createDropDB.sql
		rm -rf /tmp/createDropDB.sql
	fi
}

#sql
alias sql="mysql -u root -pigdefault"
alias sqldump="mysqldump -u root -pigdefault micar_dev > database.sql"
alias sqlrestore="mysql -u root -pigdefault micar_dev < database.sql"

#deploy on server
alias qa2login="ssh micar-qa2@qa3.intelligrape.net"
alias qalogin="ssh micar@qa3.intelligrape.net"
alias uatlogin="ssh micar-uat@qa3.intelligrape.net"
alias micarlogin="ssh -i ~/Downloads/micar-production.pem ubuntu@54.255.135.183"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

