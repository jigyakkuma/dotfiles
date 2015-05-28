# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

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
plugins=(git go ruby themes docker bower knife npm pip vagrant common-aliases)

source $ZSH/oh-my-zsh.sh

# anyenv setting
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - zsh)"
fi

# direnv setting 
eval "$(direnv hook zsh)"

# go env setting
export GOOS=linux
export GOARCH=amd64
export GOROOT=$(go env GOROOT)
export GOPATH=$HOME
export GAE_SDK_ROOT=$HOME/bin/src/go_appengine
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GAE_SDK_ROOT
export PATH=$PATH:~/bin/src/go_appengine

# developer env setting
export DEBFULLNAME="jigyakkuma"
export DEBMAIL=jigyakkuma@gmail.com

# linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

# ignore no match errors
setopt nonomatch

# color setting
export TERM=xterm-256color

# alias
alias top='htop'
alias weechat='weechat-curses'
alias diff='colordiff'
alias df='dfc'
alias lssh='lssh.sh'
alias vimrc='vim ~/.vimrc'

# editor
export EDITOR='vim'

# compdef
compdef lssh.sh=ssh

# ignore a history of duplicate
setopt hist_ignore_all_dups

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
# cd 履歴を記録
typeset -U chpwd_functions
CD_HISTORY_FILE=${HOME}/.cd_history_file # cd 履歴の記録先ファイル
function chpwd_record_history() {
    echo $PWD >> ${CD_HISTORY_FILE}
}
chpwd_functions=($chpwd_functions chpwd_record_history)

# peco を使って cd 履歴の中からディレクトリを選択
# 過去の訪問回数が多いほど選択候補の上に来る
function peco_get_destination_from_history() {
    sort ${CD_HISTORY_FILE} | uniq -c | sort -r | \
        sed -e 's/^[ ]*[0-9]*[ ]*//' | \
        sed -e s"/^${HOME//\//\\/}/~/" | \
        peco | xargs echo
}

# peco を使って cd 履歴の中からディレクトリを選択し cd するウィジェット
function peco_cd_history() {
    local destination=$(peco_get_destination_from_history)
    [ -n $destination ] && cd ${destination/#\~/${HOME}}
    zle reset-prompt
}
zle -N peco_cd_history

# peco を使って cd 履歴の中からディレクトリを選択し，現在のカーソル位置に挿入するウィジェット
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

# C-x ; でディレクトリに cd
# C-x i でディレクトリを挿入
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

# Set aws command completion
if pyenv which aws_zsh_completer.sh 1>/dev/null 2>&1; then
  source "$(pyenv which aws_zsh_completer.sh)"
fi
