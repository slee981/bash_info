parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set preferences
setopt PROMPT_SUBST
PROMPT=$'\n%F{red} %~%F{yellow}$(parse_git_branch) %f \n\n %# '

# set autocompletions 
autoload -Uz compinit && compinit
autoload bashcompinit && bashcompinit

# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# case insensitive 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# set editor
export EDITOR='code -w'

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# add to python path 
export PYTHONPATH=$PYTHONPATH:/Users/stevelee/Library/Python/3.6/bin/
export PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/3.6/bin/
export PYTHONPATH=$PYTHONPATH:/usr/local/bin/
export PYTHONPATH=$PYTHONPATH:/anaconda3/bin/python/

# make alias
alias -g c="clear"
alias -g la="ls -A"
alias -g ll="ls -al"
alias b="cd .. && clear"

# alias for git 
alias ga="git add"
alias gc="git commit"
alias gs="git status" 
alias gl="git log --oneline --graph --decorate --all"
alias gb="git branch"

# reset launchpad (when necessary) 
alias reset-launch="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

# display terminal message
python3 ~/Dropbox/CodeWorkspace/python/terminalGreeting.py


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Library/google-cloud-sdk/completion.zsh.inc'; fi
