##### PERSONAL CHANGES ######

### PATH ###

export PATH=$PATH:/opt
export PATH="$PATH:~/bin"
export PATH="$PATH:/usr/local"
export PATH="$PATH:/usr/local/anaconda3/bin"
export PATH="$PATH:/usr/local/pycharm-professional-2018.1.2/bin"
export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

### ALIASES ###

alias network="nmtui"
alias home="cd /home/ben"
alias root="cd /"
alias c="cd /mnt/c"
alias src="cd ~/src"
alias msp="cd ~/src/flight_software"
alias ll="ls -l"
alias get="sudo apt-get install"
alias unzipi="dtrx"
alias python="python3"
alias pip="pip3"
alias ozbargain="w3m ozbargain.com.au | egrep -A 3 -m 20 ^\[[0-9]+\] | egrep -v ^\[[0-9]+\] | egrep -A 2 ^[0-9]+"
alias reddit="rtv"
alias youtube="mpsyt"
alias email="mutt"
alias weather="curl wttr.in"

### GIT ###

alias gco="git checkout"
alias gcl="git clone"
alias gci="git commit"
alias gst="git status"
alias grt="git reset"
alias gbr="git branch"
alias gcp="git cherry-pick"
alias gma="git commit -am"
alias gam="git commit --amend"
alias glo="git log"
alias glt="git log --graph --oneline --decorate --all"
alias gss="git stash save"
alias gsa="git stash apply"
alias grh="git reset HEAD --hard"
alias gaa="git add ."
alias gps="git push"
alias gpf="git push -f"
alias gpu="git pull"
alias grb="git rebase"
alias gri="git rebase -i"
alias gfe="git fetch"
alias gpr="git pull --rebase"

### COLORS ###

LS_COLORS='rs=0:di=1;35:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

### Z ###
. ~/bin/z.sh


# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
