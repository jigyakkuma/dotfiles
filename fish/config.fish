# term setting
set -x TERM xterm-256color

# omf theme setting
# bobthefish
set -x theme_display_vi yes
set -x theme_color_scheme terminal-dark

# path
set -x PATH $PATH $HOME/bin/google-cloud-sdk/bin
set -x PATH $PATH $HOME/.local/bin

# developer env setting
set -x DEBFULLNAME "jigyakkuma"
set -x DEBMAIL jigyakkuma@gmail.com

# editor
set -x EDITOR 'emacs -nw'

# alias
alias vim 'emacs -nw'
alias spacemacs 'emacs'

# zsh2fish history
set -x ZSH_HISTORY_FILE $HOME/.zsh_history

# gtags setting
set -x GTAGSLABEL pygments

# search
# set fish_plugins theme peco

function fish_user_key_bindings
  bind \cr peco_select_history
end

# emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

# this function may be required
function fish_title
    true
end

# The next line updates PATH for the Google Cloud SDK.

# The next line enables shell command completion for gcloud.
# status --is-interactive; and source (/home/yamada-shinji/bin/google-cloud-sdk/completion.bash.inc | psub)
