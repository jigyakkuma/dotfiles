# direnv setting
eval (direnv hook fish)

# hub command setting
eval (hub alias -s)

# go env setting
set -x GOOS linux
set -x GOARCH amd64
set -x GOROOT (go env GOROOT)
set -x GOPATH $HOME
# set -x GAE_SDK_ROOT $HOME/bin/src/go_appengine
set -x PATH $PATH $GOROOT/bin $GOPATH/bin $GAE_SDK_ROOT
# set -x PATH $PATH $HOME/bin/src/go_appengine
set -x PATH $PATH $HOME/bin/google-cloud-sdk/bin

# developer env setting
set -x DEBFULLNAME "jigyakkuma"
set -x DEBMAIL jigyakkuma@gmail.com

# editor
set -x EDITOR 'emacs'

# alias
alias vim emacs

# zsh2fish history
set ZSH_HISTORY_FILE $HOME/.zsh_history

# search
# set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history
end

# The next line updates PATH for the Google Cloud SDK.

# The next line enables shell command completion for gcloud.
# status --is-interactive; and source (/home/yamada-shinji/bin/google-cloud-sdk/completion.bash.inc | psub)
