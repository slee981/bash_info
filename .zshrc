# STEVE'S MAC TERMINAL PROFILE 

#############################################
# FUNCTIONS  

# get git branch for display in PS1 (PROMPT)
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# shortcut for making new dir and chaning into the dir 
newdir() {
    mkdir $1 && cd $1
}

# helper for running the text to audio 
ms2audio() {
    source ~/Dropbox/CodeWorkspace/python/money-stuff/.env/bin/activate && \
    python3 ~/Dropbox/CodeWorkspace/python/money-stuff/main.py && \
    deactivate
}

#############################################
# PREFERENCES 

# set prompt 
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

# export python path 
export PYTHONPATH="/Library/Frameworks/Python.framework/Versions/3.8:$PYTHONPATH"

#############################################
# ALIASES

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

# alias for jumps 
alias cdcode="cd ~/Dropbox/CodeWorkspace"

# alias for octave 
alias octave="octave-cli"

# reset launchpad (when necessary) 
# this will help refresh the app icons if you delete apps 
alias reset_launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

# display terminal message
python3 ~/Dropbox/CodeWorkspace/python/terminalGreeting.py

# GOOGLE CLOUD API 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Library/google-cloud-sdk/completion.zsh.inc'; fi

