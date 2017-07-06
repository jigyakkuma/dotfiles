# term setting
set -x TERM xterm-256color

# omf theme setting
# bobthefish
set -x theme_display_vi yes
set -x theme_color_scheme terminal-dark

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
set -x EDITOR 'emacs -nw'

# alias
alias vim 'emacs -nw'

# zsh2fish history
set -x ZSH_HISTORY_FILE $HOME/.zsh_history

# gtags setting
set -x GTAGSLABEL pygments

# search
# set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history
end

# The next line updates PATH for the Google Cloud SDK.

# The next line enables shell command completion for gcloud.
# status --is-interactive; and source (/home/yamada-shinji/bin/google-cloud-sdk/completion.bash.inc | psub)
