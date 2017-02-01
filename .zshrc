# zsh history
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000

# zplug
export ZPLUG_HOME=/home/yamada-shinji/.linuxbrew/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "mollifier/anyframe"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# anyframe setting
zstyle ":anyframe:selector:" use peco
bindkey '^P' anyframe-widget-put-history
bindkey '^R' anyframe-widget-execute-history

zplug load --verbose

# source /usr/share/zsh/site-contrib/powerline.zsh
. ~/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

# vim keybind for zsh
bindkey -v

# compinit
autoload -Uz compinit
compinit

# linuxbrew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

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

# ignore no match errors
setopt nonomatch
setopt complete_in_word

# color setting
export TERM=xterm-256color

# alias
alias ls='ls --color=auto'
alias la='ls -la'
alias top='htop'
alias diff='colordiff'
alias df='dfc'
alias lssh='lssh.sh'
alias zshrc='emacs ~/dotfiles/.zshrc'
alias e='emacs'
alias vim='emacs'

# compdef
compdef lssh=ssh

# editor
export EDITOR='emacs'

# ignore a history of duplicate
setopt hist_ignore_all_dups
setopt auto_menu
setopt extended_glob
setopt correct
setopt re_match_pcre

# ssh agent
# {{{
if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-thing)
fi
ssh-add -l >/dev/null || alias ssh='ssh-add -l >/dev/null || ssh-add && unalias ssh; ssh'
ssh-add -l >/dev/null || alias git='ssh-add -l >/dev/null || ssh-add && unalias git; git'
# }}}

# The next line updates PATH for the Google Cloud SDK.
source '/home/yamada-shinji/bin/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/home/yamada-shinji/bin/google-cloud-sdk/completion.zsh.inc'
