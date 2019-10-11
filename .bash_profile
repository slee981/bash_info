parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set preferences
PS1="\n \[\e[31m\]\w\[\e[0m\]\033[33m\]\$(parse_git_branch)\[\033[00m\]\n\n $ "

# set editor
export EDITOR='code -w'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# add to python path 
export PYTHONPATH=$PYTHONPATH:/Users/stevelee/Library/Python/3.6/bin/
export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/3.6/bin/

# make alias
alias c="clear"
alias la="ls -A"
alias ll="ls -al"
alias matlab="octave --braindead"
alias back="cd .. && clear"

# alias for git 
alias ga="git add"
alias gc="git commit"
alias gs="git status" 
alias gl="git log --oneline --graph --decorate --all"
alias gb="git branch"

# display terminal message
# python3 ~/Documents/Code/terminalGreeting.txt

# make function for cd && ls
function cl() {
    cd "$@" && ls
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stevelee/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/stevelee/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stevelee/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/stevelee/Downloads/google-cloud-sdk/completion.bash.inc'; fi

