parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set preferences
PS1="\n\[\e[31m\]\w\[\e[0m\] \033[33m\]\$(parse_git_branch)\[\033[00m\]\n\n $ "

# set editor
export EDITOR='code -w'

# add to python path 
export PYTHONPATH=$PYTHONPATH:/Users/stevelee/Library/Python/3.6/bin/
export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/3.6/bin/
export PYTHONPATH=$PYTHONPATH:/usr/local/bin/
export PYTHONPATH=$PYTHONPATH:/anaconda3/bin/python/

# make alias
alias c="clear"
alias la="ls -A"
alias matlab="octave --braindead"
alias back="cd .. && clear"

# alias for git 
alias ga="git add ."
alias gc="git commit -m"
alias gs="git status" 
alias gl="git log --oneline --graph --decorate --all"
alias gb="git branch"

# display terminal message
# python3 ~/Documents/Code/terminalGreeting.txt

# make function for cd && ls
function cl() {
    cd "$@" && ls
}

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
