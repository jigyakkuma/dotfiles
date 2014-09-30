# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git go ruby themes)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi
#export PATH="$HOME/.plenv/bin:$PATH"
#eval "$(plenv init - zsh)"
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
export GOOS=linux
export GOARCH=amd64
export GOROOT=$(go env GOROOT)
export GOPATH=$HOME
export GAE_SDK_ROOT=$HOME/bin/src/go_appengine
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GAE_SDK_ROOT
export DEBFULLNAME="jigyakkuma"
export DEBMAIL=jigyakkuma@gmail.com

setopt nonomatch

# color setting
export TERM=xterm-256color

# alias
alias top='htop'
alias weechat='weechat-curses'
alias diff='colordiff'
alias df='dfc'

# ignore a history of duplicate
setopt hist_ignore_all_dups

# zaw
#source ~/widget/zsh/zaw/zaw.zsh
# zaw bindkey
#bindkey '^R' zaw-history

# peco history
function exists { which $1 &> /dev/null }

if exists peco; then
    function peco_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N peco_select_history
    bindkey '^R' peco_select_history
fi

# {{{
# cd $BMzNr$r5-O?(B
typeset -U chpwd_functions
CD_HISTORY_FILE=${HOME}/.cd_history_file # cd $BMzNr$N5-O?@h%U%!%$%k(B
function chpwd_record_history() {
    echo $PWD >> ${CD_HISTORY_FILE}
}
chpwd_functions=($chpwd_functions chpwd_record_history)

# peco $B$r;H$C$F(B cd $BMzNr$NCf$+$i%G%#%l%/%H%j$rA*Br(B
# $B2a5n$NK,Ld2s?t$,B?$$$[$IA*Br8uJd$N>e$KMh$k(B
function peco_get_destination_from_history() {
    sort ${CD_HISTORY_FILE} | uniq -c | sort -r | \
        sed -e 's/^[ ]*[0-9]*[ ]*//' | \
        sed -e s"/^${HOME//\//\\/}/~/" | \
        peco | xargs echo
}

# peco $B$r;H$C$F(B cd $BMzNr$NCf$+$i%G%#%l%/%H%j$rA*Br$7(B cd $B$9$k%&%#%8%'%C%H(B
function peco_cd_history() {
    local destination=$(peco_get_destination_from_history)
    [ -n $destination ] && cd ${destination/#\~/${HOME}}
    zle reset-prompt
}
zle -N peco_cd_history

# peco $B$r;H$C$F(B cd $BMzNr$NCf$+$i%G%#%l%/%H%j$rA*Br$7!$8=:_$N%+!<%=%k0LCV$KA^F~$9$k%&%#%8%'%C%H(B
function peco_insert_history() {
    local destination=$(peco_get_destination_from_history)
    if [ $? -eq 0 ]; then
        local new_left="${LBUFFER} ${destination} "
        BUFFER=${new_left}${RBUFFER}
        CURSOR=${#new_left}
    fi
    zle reset-prompt
}
zle -N peco_insert_history

# C-x ; $B$G%G%#%l%/%H%j$K(B cd
# C-x i $B$G%G%#%l%/%H%j$rA^F~(B
bindkey '^x;' peco_cd_history
bindkey '^xi' peco_insert_history

# window-name auto rename for ssh
function ssh() {
    local window_name=$(tmux display -p '#{window_name}')
    command ssh $@
    tmux rename-window $window_name
}

# Go to GHQ Management Repository 
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
