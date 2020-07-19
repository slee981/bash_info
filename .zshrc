# STEVE'S MAC TERMINAL PROFILE 

#############################################
# FUNCTIONS  

# make twitter search save to appropriate directory 
search_twitter() {
    source ~/Dropbox/CodeWorkspace/python/Twitter-Search-API-Python/.env/bin/activate && \ 
    python3 ~/Dropbox/CodeWorkspace/python/Twitter-Search-API-Python/main.py $* && \
    deactivate
}

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

# change tab color in iTerm
i=1
tc() {
    if [ $# -ne 0 ]; then
        color="$1"
    else
        color="${i}";
        i=$(( i + 1 ))
    fi

    # check if color is number and between 0 and 7
    if [[ $color =~ '^[0-9]+$' ]]; then 
        color=$(( color % 8 )); 
        i=$(( color + 1))
    fi

    case ${color} in
        black | k | "0")
            echo -e "\033]6;1;bg;red;brightness;0\a"
            echo -e "\033]6;1;bg;green;brightness;0\a"
            echo -e "\033]6;1;bg;blue;brightness;0\a"
            ;;
        green | g | "1")
            echo -e "\033]6;1;bg;red;brightness;57\a"
            echo -e "\033]6;1;bg;green;brightness;197\a"
            echo -e "\033]6;1;bg;blue;brightness;77\a"
            ;;
        red | r | "2")
            echo -e "\033]6;1;bg;red;brightness;270\a"
            echo -e "\033]6;1;bg;green;brightness;60\a"
            echo -e "\033]6;1;bg;blue;brightness;83\a"
            ;;
        orange | o | "3")
            echo -e "\033]6;1;bg;red;brightness;227\a"
            echo -e "\033]6;1;bg;green;brightness;143\a"
            echo -e "\033]6;1;bg;blue;brightness;10\a"
            ;;
        blue | b | "4")
            echo -e "\033]6;1;bg;red;brightness;66\a"
            echo -e "\033]6;1;bg;green;brightness;138\a"
            echo -e "\033]6;1;bg;blue;brightness;245\a"
            ;;
        yellow | y | "5")
            echo -e "\033]6;1;bg;red;brightness;245\a"
            echo -e "\033]6;1;bg;green;brightness;221\a"
            echo -e "\033]6;1;bg;blue;brightness;66\a"
            ;;
        grey | gy | "6")
            echo -e "\033]6;1;bg;red;brightness;173\a"
            echo -e "\033]6;1;bg;green;brightness;173\a"
            echo -e "\033]6;1;bg;blue;brightness;173\a"
            ;;
        white | w | "7")
            echo -e "\033]6;1;bg;red;brightness;255\a"
            echo -e "\033]6;1;bg;green;brightness;255\a"
            echo -e "\033]6;1;bg;blue;brightness;255\a"
            ;;
    esac
}

#############################################
# PREFERENCES 

# display terminal message
# python3 ~/Dropbox/CodeWorkspace/python/terminalGreeting.py

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
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"

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
alias reset-launchpad="defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock"

# bcrypt password generator shortcut 
alias bcrypt-pwdgen="htpasswd -nBC 10 'user'"

# make new chord progression 
alias newprog="python3 ~/Dropbox/CodeWorkspace/python/Progression.py"

# GOOGLE CLOUD API 

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Library/google-cloud-sdk/path.zsh.inc' ]; then . '/Library/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Library/google-cloud-sdk/completion.zsh.inc' ]; then . '/Library/google-cloud-sdk/completion.zsh.inc'; fi

#############################################
# PATHS 

export GOPATH=$HOME/Documents/AppData/go

#############################################
# DOCKER COMMAND ALIASES 

alias haskell-docker='docker run -it --rm -v $PWD:/usr/src/ haskell:8'
alias go-docker='docker run -it --rm -v $PWD:/usr/stephen/ golang-vim'
alias python-docker='docker run -it --rm -v $PWD:/usr/src/ python-vim'

