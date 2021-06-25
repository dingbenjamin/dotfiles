# Path to youdr oh-my-zsh installation.
export ZSH="/Users/ben/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

#####################
# User configuration
#####################

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/Users/bding/bin

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-files'

alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias vb='vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias sz='source ~/.zshrc'

alias python='python3'

################
# fzf functions
################

# Change to proper log directory
cdl ()
{
    if [[ -n $1 ]]; then
        comp=$1
        case $comp in
            er)
                cd $LOG_DIR/com/valescom/eventrouter/status/$HOSTNAME
            ;;
            su)
                cd $LOG_DIR/com/valescom/stateupdater/status/$HOSTNAME
            ;;
            dr)
                cd $LOG_DIR/com/imc/driver/status/$HOSTNAME
            ;;
            ts)
                cd $LOG_DIR/com/imc/traderserver/status/$HOSTNAME
            ;;
            co)
                cd $LOG_DIR/com/imc/driver/combo/status/$HOSTNAME
            ;;
            cm)
                cd $LOG_DIR/com/imc/configmanager/status/$HOSTNAME
            ;;
            pu)
                cd $LOG_DIR/com/imc/positionupdater/status/$HOSTNAME
            ;;
            tg)
                cd $LOG_DIR/com/imc/tradinggui/status/$HOSTNAME
            ;;
            *)
                echo "Invalid component"
            ;;
        esac
    else
        cd $LOG_DIR/com/valescom/eventrouter/status/$HOSTNAME
    fi
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() (
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
)

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

function delete-branches() {
  git branch |
    grep --invert-match '\*' |
    cut -d"]" -f2- |
    fzf --multi --preview="git log {}" |
    xargs --no-run-if-empty git branch --delete --force
}

#####################
# Scm Breeze
#####################

[ -s "/Users/bding/.scm_breeze/scm_breeze.sh" ] && source "/Users/bding/.scm_breeze/scm_breeze.sh"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
