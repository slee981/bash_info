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
# python3 ~/Documents/Code/terminalGreeting.txt

# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/stevelee/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/stevelee/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/stevelee/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/stevelee/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
