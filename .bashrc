#Source global definitions
if [ -f /etc/bashrc ]; then
            . /etc/bashrc
fi

#####################
# User configuration
#####################

export LANG=en_US.UTF-8

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/home/bin

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore-files'
export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '

alias vv='vim ~/.vimrc'
alias vz='vim ~/.zshrc'
alias sb='source ~/.bashrc'

################
# User functions
################

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

nsdate() {
    [[ -z $1 ]] && { echo "Usage: chidate|utdate ns"; return; }
    local st=$1
    local nst=0
    # 10 digits for seconds - good for a while
    local digits=$(echo -n $1|wc -c)
    if [[ $digits -gt 10 ]]; then
        local div=$(( 10 ** ($digits - 10) ))
        st=$(( $1 / $div ))
        nst=$(( $1 % $div ))
    fi
    if [[ $(uname -s) == Darwin ]]; then
        datecmd=gdate
    else
        datecmd=date
    fi

    if ! command -v $datecmd >/dev/null 2>&1; then
        >&2 echo "Missing $datecmd. Please install $datecmd."
        return
    fi

    printf "%s.%09d\n" "$($datecmd -d @${st} +"%Y-%m-%d %H:%M:%S")" "${nst}"
}

alias chidate="TZ='America/Chicago' nsdate"
alias utdate="TZ='UTC' nsdate"

#####################
# RVM
#####################

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#####################
# Scm Breeze
#####################

[ -s "/home/.scm_breeze/scm_breeze.sh" ] && source "/home/.scm_breeze/scm_breeze.sh"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'

#####################
# fzf
#####################

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
